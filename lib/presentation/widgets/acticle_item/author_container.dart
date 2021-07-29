import 'package:flutter/material.dart';

import '/data/models/article.dart';
import '/presentation/widgets/acticle_item/author_extra_info.dart';

class AuthorContainer extends StatelessWidget {
  final List<Article> news;
  final int index;
  AuthorContainer(this.news, this.index);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
