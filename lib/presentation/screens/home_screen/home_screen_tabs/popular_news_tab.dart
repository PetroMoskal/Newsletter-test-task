import 'package:flutter/material.dart';
import 'package:news_app_test_task/data/models/article.dart';

import 'package:news_app_test_task/logic/all_news.dart';
import 'package:news_app_test_task/presentation/widgets/acticle_item/article_item.dart';
import 'package:provider/provider.dart';

class PopularNewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Article> news = Provider.of<AllNews>(context).popularNews();

    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, i) =>
          articleItem(news: news, index: i, context: context),
    );
  }
}
