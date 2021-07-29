import 'package:flutter/material.dart';
import 'package:news_app_test_task/logic/all_news.dart';
import 'package:news_app_test_task/presentation/widgets/spacer.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final topicColor = Theme.of(context).primaryColor;
    final header = Provider.of<AllNews>(context).header();

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
                        Provider.of<AllNews>(context, listen: false)
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
