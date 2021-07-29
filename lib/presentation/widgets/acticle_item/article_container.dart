import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import '/data/models/article.dart';

class ArticleContainer extends StatelessWidget {
  final List<Article> news;
  final int index;
  ArticleContainer(this.news, this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
