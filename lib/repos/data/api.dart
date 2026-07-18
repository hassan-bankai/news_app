abstract class Api {
  //GET https://newsapi.org/v2/everything?q=bitcoin&apiKey=5576bc065ff44974afbd0cc753011963

  static String baseUrl = 'newsapi.org';
  static String endPoint = '/v2/everything';
  static Map<String, dynamic> queryPrams = {
    'q': 'sport',
    'apiKey': '5576bc065ff44974afbd0cc753011963',
  };
}
