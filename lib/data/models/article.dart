class Article {
  DateTime date;
  String title;
  String newsText;
  String topic;
  int likes;
  bool isLiked;

  Article({
    required this.date,
    required this.title,
    required this.newsText,
    required this.topic,
    required this.likes,
    required this.isLiked,
  });
}
