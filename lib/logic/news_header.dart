import 'package:flutter/material.dart';

import '/data/repositories/news_repo.dart';
import '/data/models/article.dart';
import '/data/models/header.dart';

class NewsHeader with ChangeNotifier {
  final _list = NewsRepo().newsList;

  Header header() {
    return Header(title: _todaysNewsSordeByLikes().first.topic);
  }

  bool get headerIsActive {
    return _headerIsActive;
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
