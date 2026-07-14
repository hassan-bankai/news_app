import 'package:flutter/material.dart';
import 'package:news_app/presentation/widgets/news_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News App")),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return NewsViewWidget(
            imagePath: "assets/image/dummy_image.png",
            country: "Europe",
            title: "Russian warship: Moskva sinks in Black Sea ",
            onTap: () {},
          );
        },
      ),
    );
  }
}
