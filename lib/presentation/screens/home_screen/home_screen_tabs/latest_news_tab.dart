import 'package:flutter/material.dart';
import 'package:news_app_test_task/data/models/article.dart';

import 'package:news_app_test_task/logic/all_news.dart';
import 'package:news_app_test_task/presentation/widgets/acticle_item/article_item.dart';
import 'package:news_app_test_task/presentation/widgets/header.dart';
import 'package:provider/provider.dart';

class LatestNewsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Article> news = Provider.of<AllNews>(context).latestNews();

    final headerIsActive = Provider.of<AllNews>(context).headerIsActive;

    return Column(
      children: [
        headerIsActive ? Header() : Container(),
        Expanded(
          child: ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, i) =>
                articleItem(news: news, index: i, context: context),
          ),
        ),
      ],
    );
  }
}
