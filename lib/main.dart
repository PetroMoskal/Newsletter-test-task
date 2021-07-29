import 'package:flutter/material.dart';
import 'package:news_app_test_task/logic/all_news.dart';
import 'package:news_app_test_task/presentation/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AllNews()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Color.fromRGBO(75, 187, 205, 1),
          // scaffoldBackgroundColor: Colors.grey.shade200,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
