import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/data/models/article.dart';
import '/logic/all_news.dart';
import '/presentation/widgets/acticle_item/news_article_item.dart';

class PopularNewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Article> news = Provider.of<AllNews>(context).popularNews();

    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, i) => NewsArticleItem(news, i),
    );
  }
}
