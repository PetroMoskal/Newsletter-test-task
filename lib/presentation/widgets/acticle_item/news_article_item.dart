import 'package:flutter/material.dart';

import '/data/models/article.dart';
import '/presentation/widgets/acticle_item/author_container.dart';
import '/presentation/widgets/acticle_item/article_container.dart';
import '/presentation/widgets/acticle_item/article_item_buttons.dart';
import '../spacer.dart';

class NewsArticleItem extends StatelessWidget {
  final List<Article> news;
  final int index;
  NewsArticleItem(this.news, this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              AuthorContainer(news, index),
              ArticleContainer(news, index),
              ArticleItemButtons(news, index)
            ],
          ),
        ),
        spacer()
      ],
    );
  }
}
