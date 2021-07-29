import 'package:flutter/material.dart';
import 'package:news_app_test_task/data/models/article.dart';
import 'package:news_app_test_task/data/models/header.dart';
import 'package:news_app_test_task/data/repositories/news_repo.dart';

class AllNews with ChangeNotifier {
  final _list = NewsRepo().newsList;

  List<Article> allNews() => _list;

  Header header() {
    return Header(title: _todaysNewsSordeByLikes().first.topic);
  }

  bool get headerIsActive {
    return _headerIsActive;
  }

  void resetFavorite(int index) {
    !_list[index].isFavorite
        ? _list[index].isFavorite = true
        : _list[index].isFavorite = false;
    notifyListeners();
  }

  List<Article> subscriptionNews() {
    List<Article> favoriteNews = [];
    favoriteNews.addAll(_list.where((element) => element.isFavorite == true));
    return favoriteNews;
  }

  bool _headerIsActive = true;

  List<Article> _todaysNewsSordeByLikes() {
    List<Article> todaysNews = [];
    todaysNews.addAll(
        _list.where((element) => element.date.day == DateTime.now().day));
    todaysNews.sort((a, b) => b.likes.compareTo(a.likes));
    return todaysNews;
  }

  void closeHeader() {
    _headerIsActive = false;
    notifyListeners();
  }
}
