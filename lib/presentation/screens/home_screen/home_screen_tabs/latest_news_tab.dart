import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/data/models/article.dart';
import '/logic/all_news.dart';
import '/logic/news_header.dart';
import '/presentation/widgets/acticle_item/news_article_item.dart';
import '/presentation/widgets/header.dart';

class LatestNewsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Article> news = Provider.of<AllNews>(context).latestNews();

    final headerIsActive = Provider.of<NewsHeader>(context).headerIsActive;

    return Column(
      children: [
        headerIsActive ? Header() : Container(),
        Expanded(
          child: ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, i) => NewsArticleItem(news, i),
          ),
        ),
      ],
    );
  }
}
