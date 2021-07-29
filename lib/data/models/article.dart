import 'package:news_app_test_task/data/models/author.dart';

class Article {
  String id;
  Author author;
  DateTime date;
  String title;
  String newsText;
  String topic;
  int likes;
  bool isLiked;
  int commentsQty;
  bool isFavorite;
  String? picture;

  Article({
    required this.id,
    required this.author,
    required this.date,
    required this.title,
    required this.newsText,
    required this.topic,
    required this.likes,
    required this.isLiked,
    required this.commentsQty,
    required this.isFavorite,
    this.picture,
  });
}
