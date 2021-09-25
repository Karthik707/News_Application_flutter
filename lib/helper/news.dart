import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/article_view.dart';
import 'package:http/http.dart' as http;
class News{
  List<ArticleModel> news = [];
  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=60f6a67902b84ea784aedb2f1bd896c0";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element){

        if(element["urlToImage"]!=null && element['description']!=null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            url: element["url"],
            articleUrl: element["urlToImage"],
          );
          news.add(articleModel);
        }
    });
    }


  }
}
class CategoryNewsClass{
  List<ArticleModel> news = [];
  Future<void> getNews(String category) async{
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=60f6a67902b84ea784aedb2f1bd896c0";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element){

        if(element["urlToImage"]!=null && element['description']!=null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            url: element["url"],
            articleUrl: element["urlToImage"],
          );
          news.add(articleModel);
        }
      });
    }


  }
}