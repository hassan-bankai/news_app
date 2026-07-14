import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/data/api.dart';
import 'package:news_app/models/news_model.dart';

typedef JSON = Map<String, dynamic>;

class ApiCalling {
  Future<NewsModel> getData() async {
    try {
      Uri uri = Uri.https(Api.baseUrl, Api.endPoint, Api.queryPrams);
      http.Response response = await http.get(uri);
      print(uri);
      var responseBody = response.body;
      JSON json = jsonDecode(responseBody);
      return NewsModel.fromJson(json);
    } catch (e) {
      print('error, $e');
      return NewsModel(status: 'error', totalResults: 0, articles: []);
    }
  }
}
