import 'package:news_app/repos/data/api_calling.dart';
import 'package:news_app/repos/models/articles_model.dart';
import 'package:news_app/repos/models/news_model.dart';

abstract interface class FetchData {
  Future<List<Articles>> getData();
}

class FetchDataFromApi implements FetchData {
  @override
  Future<List<Articles>> getData() async {
    ApiCalling apiCalling = ApiCalling();
    NewsModel newsModel = await apiCalling.getData();
    return newsModel.articles ?? [];
  }
}
