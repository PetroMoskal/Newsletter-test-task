import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/logic/all_news.dart';
import '/logic/news_header.dart';
import '/presentation/screens/home_screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AllNews()),
        ChangeNotifierProvider.value(value: NewsHeader()),
      ],
      child: MaterialApp(
        title: 'Newsletter App',
        theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Color.fromRGBO(75, 187, 205, 1),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
