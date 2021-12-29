import 'dart:convert';
import 'package:dip_app/model/news_model.dart';
import 'package:http/http.dart' as http;

class Http {
  static String url =
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=82ba4205494946078b0a8c1bf43f9cfb';

  static String urlSport =
      'https://newsapi.org/v2/top-headlines?country=us&category=sport&apiKey=82ba4205494946078b0a8c1bf43f9cfb';

  static Future<NewsData> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    var midiat = jsonDecode(response.body);
    return NewsData.fromJson(midiat);
  }

  static Future<NewsData> getDataSport() async {
    http.Response response = await http.get(Uri.parse(urlSport));
    var midiate = jsonDecode(response.body);
    return NewsData.fromJson(midiate);
  }
}
