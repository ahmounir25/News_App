import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/models/NewsResponse.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/modules/homeScreen.dart';
import 'package:news/shared/remote/Constants.dart';

class ApiManager {
  static Future<SourcesResponse> getSources(String catID) async {
    //https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
    Uri URL =
    Uri.https(BaseURL, '/v2/top-headlines/sources', {"apiKey": apiKey,'category':catID});
    Response sources = await http.get(URL);
    try {
      var json = jsonDecode(sources
          .body); //body contain info that we want (in map) so create data model to convert
      SourcesResponse src = SourcesResponse.fromJson(json);
      return src;
    }
    catch (e){
      print('Error is $e');
      throw e;
    }
  }
  static Future<NewsResponse> getNews(String srcID)async{
    //https://newsapi.org/v2/everything?apiKey=d2d4ffc8e3124861bd2eac1672a2df42&sources=abc-news
    Uri URL=Uri.https(BaseURL, '/v2/everything',{
      'apiKey':apiKey,'sources':srcID
    });
    Response news =await http.get(URL);
    var data=jsonDecode(news.body);
    NewsResponse newsResponse=NewsResponse.fromJson(data);
    return newsResponse;
  }

}
