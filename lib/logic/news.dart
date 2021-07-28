import 'package:flutter/material.dart';
import 'package:news_app_test_task/data/models/article.dart';
import 'package:news_app_test_task/data/repositories/news_repo.dart';

class News with ChangeNotifier {
  final _list = NewsRepo().newsList;

  List<Article> latestNews() => _list;
  String header() => _list[0].title;
}
