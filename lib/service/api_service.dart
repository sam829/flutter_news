import 'package:http/http.dart' as http;
import 'package:flutter_news/model/article_model.dart';
import 'dart:convert';

class ApiService {
  static const _base_URL = "newsapi.org";
  static const _end_point = "/v2/top-headlines";

  Future<List<Article>> getArticle(String category) async {
    final requestParams = {
      'country': 'in',
      'apiKey': 'your_api_key',
      'pageSize': '100',
      'category': category
    };

    final url = Uri.https(_base_URL, _end_point, requestParams);
    final response = await http.Client().get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> arrayOfArticles = json['articles'];
    List<Article> articles = arrayOfArticles
        .map((dynamic article) => Article.fromJson(article))
        .toList();
    return articles;
  }
}
