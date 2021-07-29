import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import 'package:news_app_test_task/logic/all_news.dart';
import 'package:news_app_test_task/presentation/widgets/header.dart';
import 'package:provider/provider.dart';

class LatestNewsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final news = Provider.of<AllNews>(context).allNews();

    final headerIsActive = Provider.of<AllNews>(context).headerIsActive;

    return Column(
      children: [
        headerIsActive ? Header() : Container(),
        Expanded(
          child: ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, i) => Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                news[i].author.avatarLink,
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            news[i].author.fullName,
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
                          news[i].title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      news[i].picture.isNotEmpty
                          ? Image.network(news[i].picture.toString())
                          : Container(),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          news[i].newsText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              formatDate(
                                  news[i].date, [dd, ' ', MM, ' ', yyyy]),
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_forward,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                Text(
                                  news[i].topic,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.favorite_outline)),
                                      Text(news[i].likes.toString()),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                              Icons.mode_comment_outlined)),
                                      Text(news[i].commentsQty.toString()),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {}, icon: Icon(Icons.share))
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: IconButton(
                                  onPressed: () {
                                    Provider.of<AllNews>(context, listen: false)
                                        .resetFavorite(i);
                                    print(news[i].isFavorite);
                                  },
                                  icon: !news[i].isFavorite
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
                Container(
                  color: Colors.grey.shade200,
                  height: 8,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AuthorExtraInfo extends StatelessWidget {
  final String info;
  final Color color;
  AuthorExtraInfo(this.info, this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: color,
      ),
      child: Text(
        info,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
