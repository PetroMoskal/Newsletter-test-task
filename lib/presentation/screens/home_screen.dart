import 'package:flutter/material.dart';
import 'package:news_app_test_task/logic/news.dart';

class HomeScreen extends StatelessWidget {
  final latestNews = News().latestNews();
  final header = News().header();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(header),
      ),
      body: ListView(
        children: latestNews.map((e) => Text(e.title.toString())).toList(),
      ),
    );
  }
}
