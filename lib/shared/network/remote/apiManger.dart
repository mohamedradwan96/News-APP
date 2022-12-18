import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/shared/constant/constants.dart';

import '../../../models/NewsResponse.dart';

class ApiManger {
  static Future<SourcesResponse> GetSourse() async {
    Uri url = Uri.https(Base, "/v2/top-headlines/sources", {"apiKey": ApiKey});

    Response sources = await http.get(url);
    try {
      var json = jsonDecode(sources.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse> GetNews(String sourceId) async {
    Uri url = Uri.https(Base, "/v2/everything",
        {"apiKey": ApiKey,
          "sources" : sourceId,

        });
    Response newsData = await http.get(url);
    var json = jsonDecode(newsData.body);
    
    try {
      
      NewsResponse newsResponse = NewsResponse.fromJson(json);
      return newsResponse;
    } catch (e) {
      throw e;
    }
  }
}
