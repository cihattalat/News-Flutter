import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/models/news_api_model.dart';

class NewsApiServices{
  static String _apiKey= "853ac7418d3a480e94a8115c18edf3c6";
  static final String _url = "https://newsapi.org/v2/top-headlines?country=tr&apiKey=$_apiKey";

  static Future<List<Article>> fetchNewsArticle() async{
    
    try{
      Response response = await Dio().get(_url);
      NewsApi newsApi = NewsApi.fromJson(response.data);
      return newsApi.articles;
    }
    on DioError catch(e){
      print(e);
      return [];
    }



  }


}