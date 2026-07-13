import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/home_page.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff1877F2),
        scaffoldBackgroundColor: Color(0xff202020),

        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff1877F2),
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 22, fontWeight: .bold),
        ),
      ),
    );
  }
}
