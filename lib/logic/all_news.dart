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

  List<Article> latestNews() {
    _list.sort((a, b) => b.date.compareTo(a.date));
    return _list;
  }

  List<Article> popularNews() {
    _list.sort((a, b) => b.likes.compareTo(a.likes));
    return _list;
  }

  List<Article> subscribedNews() {
    List<Article> favoriteNews = [];
    favoriteNews.addAll(_list.where((element) => element.isFavorite == true));
    return favoriteNews;
  }

  bool get headerIsActive {
    return _headerIsActive;
  }

  void resetLike(String id) {
    !_list[getIndexById(id)].isLiked ? _like(id) : _disLike(id);
  }

  void _like(String id) {
    _list[getIndexById(id)].isLiked = true;
    _list.singleWhere((element) => element.id == id).likes += 1;
    notifyListeners();
  }

  void _disLike(String id) {
    _list[getIndexById(id)].isLiked = false;
    _list.singleWhere((element) => element.id == id).likes -= 1;

    notifyListeners();
  }

  void resetFavorite(String id) {
    !_list[getIndexById(id)].isFavorite
        ? _list[getIndexById(id)].isFavorite = true
        : _list[getIndexById(id)].isFavorite = false;
    notifyListeners();
  }

  int getIndexById(String id) => _list.indexWhere((e) => e.id == id);

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
