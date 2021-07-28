import 'package:flutter_lorem/flutter_lorem.dart';

class NewsData {
  List<Map<String, Object>> get newsRawData {
    return List.generate(10, (index) {
      return {
        'title': lorem(paragraphs: 1, words: 3),
        'date': DateTime.now().subtract(Duration(hours: 7 * index)),
        'newsText': lorem(paragraphs: 3, words: 40),
        'topic': lorem(paragraphs: 1, words: 3),
        'likes': 10 + index,
      };
    });
  }
}
