import 'dart:math';
import 'package:flutter_lorem/flutter_lorem.dart';

import '/data/models/author.dart';

class NewsData {
  Random random = Random();

  List<Map<String, Object?>> get newsRawData {
    return List.generate(
      7,
      (index) {
        return {
          'title': lorem(paragraphs: 1, words: 3),
          'date': DateTime.now().subtract(Duration(hours: 7 * index)),
          'newsText': lorem(paragraphs: 1, words: 25),
          'topic': lorem(paragraphs: 1, words: 3),
          'likes': random.nextInt(12),
          'comments': random.nextInt(12),
          'pictureLink': index.isOdd
              ? 'https://images.pexels.com/photos/1181244/pexels-photo-1181244.jpeg?cs=srgb&dl=pexels-christina-morillo-1181244.jpg&fm=jpg'
              : null,
          'author': Author(
            avatarLink:
                'https://images.pexels.com/photos/3292558/pexels-photo-3292558.jpeg?cs=srgb&dl=pexels-ekrulila-3292558.jpg&fm=jpg',
            fullName: 'Lera Klymenko',
          ),
        };
      },
    );
  }
}
