import 'package:flutter/material.dart';

import '/data/repositories/news_repo.dart';
import '/data/models/article.dart';

class AllNews with ChangeNotifier {
  final _list = NewsRepo().newsList;

  List<Article> allNews() => _list;

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
}
