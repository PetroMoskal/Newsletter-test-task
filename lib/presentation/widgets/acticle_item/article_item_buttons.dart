import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/data/models/article.dart';
import '/logic/all_news.dart';

class ArticleItemButtons extends StatelessWidget {
  final List<Article> news;
  final int index;
  ArticleItemButtons(this.news, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Provider.of<AllNews>(context, listen: false)
                              .resetLike(news[index].id);
                        },
                        icon: !news[index].isLiked
                            ? Icon(Icons.favorite_outline)
                            : Icon(Icons.favorite_rounded,
                                color: Colors.red.shade300)),
                    Text(news[index].likes.toString()),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.mode_comment_outlined)),
                    Text(news[index].commentsQty.toString()),
                  ],
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.share))
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: IconButton(
                onPressed: () {
                  Provider.of<AllNews>(context, listen: false)
                      .resetFavorite(news[index].id);
                },
                icon: !news[index].isFavorite
                    ? Icon(Icons.star_outline_outlined)
                    : Icon(Icons.star_outlined, color: Colors.red.shade300)),
          ),
        ],
      ),
    );
  }
}
