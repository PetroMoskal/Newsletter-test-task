import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/logic/news_header.dart';
import '/presentation/widgets/spacer.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final topicColor = Theme.of(context).primaryColor;
    final header = Provider.of<NewsHeader>(context).header();

    return Column(
      children: [
        spacer(),
        Container(
          padding: EdgeInsets.only(left: 12),
          color: Theme.of(context).accentColor,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_forward,
                        size: 15,
                        color: topicColor,
                      ),
                      Text(
                        '  Topic of the day',
                        style: TextStyle(color: topicColor),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        Provider.of<NewsHeader>(context, listen: false)
                            .closeHeader();
                      },
                      child: Icon(
                        Icons.close,
                        color: topicColor,
                      ))
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(bottom: 26, right: 12),
                child: Text(
                  header.title,
                  style: TextStyle(
                      color: topicColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        spacer()
      ],
    );
  }
}
