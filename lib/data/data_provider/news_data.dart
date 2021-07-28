import 'package:flutter_lorem/flutter_lorem.dart';

class NewsData {
  static final NewsData _singleton = NewsData._internal();

  factory NewsData() {
    return _singleton;
  }

  NewsData._internal();

  List<Map<String, Object>> test = [];

  List<Map<String, Object>> get newsRawData {
    if (test.isEmpty) {
      test = List.generate(10, (index) {
        return {
          'title': lorem(paragraphs: 1, words: 3),
          'date': DateTime.now().subtract(Duration(hours: 7 * index)),
          'newsText': lorem(paragraphs: 3, words: 40),
          'topic': lorem(paragraphs: 1, words: 3),
          'likes': 10 + index,
        };
      });
    }
    return test;
  }
}
