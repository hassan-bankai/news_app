import 'package:flutter/material.dart';
import 'package:news_app/logic/fetch_data.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/presentation/widgets/news_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FetchData data = FetchDataFromApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News App")),
      body: FutureBuilder<List<Articles>>(
        future: data.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 22,
                  fontWeight: .bold,
                ),
              ),
            );
          }
          if (snapshot.hasData) {
            var articleList = snapshot.data ?? [];
            return ListView.builder(
              itemCount: articleList.length,
              itemBuilder: (context, index) {
                return NewsViewWidget(
                  imagePath: articleList[index].urlToImage,

                  country: articleList[index].author ?? '',
                  title: articleList[index].title ?? '',
                  onTap: () {},
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
