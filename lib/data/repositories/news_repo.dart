import 'package:news_app_test_task/data/data_provider/news_data.dart';
import 'package:news_app_test_task/data/models/article.dart';

class NewsRepo {
  static final NewsRepo _singleton = NewsRepo._internal();

  factory NewsRepo() {
    return _singleton;
  }

  NewsRepo._internal();

  final _newsRawData = NewsData().newsRawData;
  List<Article> get newsList {
    final List<Article> allNewsList = [];
    _newsRawData.forEach((element) {
      allNewsList.add(Article(
          date: element['date'] as DateTime,
          title: element['title'].toString(),
          newsText: element['newsText'].toString(),
          topic: element['topic'].toString(),
          likes: element['likes'] as int,
          isLiked: false));
    });
    return allNewsList;
  }
}
