import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/data/models/article.dart';
import '/logic/all_news.dart';
import '/presentation/widgets/acticle_item/news_article_item.dart';

class SubscriptionsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Article> news = Provider.of<AllNews>(context).subscribedNews();

    return news.isEmpty
        ? Center(
            child: Text('You have no news marked as favorite'),
          )
        : ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, i) => NewsArticleItem(news, i),
          );
  }
}
