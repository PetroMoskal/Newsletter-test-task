import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:news_app_test_task/data/models/article.dart';
import 'package:news_app_test_task/logic/all_news.dart';
import 'package:provider/provider.dart';

import '../spacer.dart';
import 'author_extra_info.dart';

Column articleItem({
  required List<Article> news,
  required int index,
  required BuildContext context,
}) {
  return Column(
    children: [
      Container(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      news[index].author.avatarLink,
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                      errorBuilder: (context, url, error) =>
                          Icon(Icons.person_outline_outlined),
                    ),
                  ),
                ),
                Text(
                  news[index].author.fullName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                AuthorExtraInfo('2y 1m', Colors.red.shade300),
                SizedBox(width: 8),
                AuthorExtraInfo('2h', Theme.of(context).accentColor),
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                news[index].title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            news[index].picture == null
                ? Container()
                : Image.network(
                    news[index].picture.toString(),
                    errorBuilder: (context, url, error) => Container(),
                  ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                news[index].newsText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatDate(news[index].date, [dd, ' ', MM, ' ', yyyy]),
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_forward,
                        size: 15,
                        color: Colors.grey,
                      ),
                      Text(
                        news[index].topic,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
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
                            : Icon(Icons.star_outlined,
                                color: Colors.red.shade300)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      spacer()
    ],
  );
}
