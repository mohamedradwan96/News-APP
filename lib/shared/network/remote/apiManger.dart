import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/shared/constant/constants.dart';
import 'package:provider/provider.dart';

import '../../../models/NewsResponse.dart';
import '../../../provider/app_provider.dart';

class ApiManger {
  static Future<SourcesResponse> GetSourse(String categoryId) async {
    Uri url = Uri.https(Base, "/v2/top-headlines/sources",
        {
          "apiKey": ApiKey,
          "category": categoryId,

        });

    Response sources = await http.get(url);
    try {
      var json = jsonDecode(sources.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse> GetNews({ String? sourceId,String? searchkey,String? currentLang}) async {
    Uri url = Uri.https(Base, "/v2/everything", {
      "apiKey": ApiKey,
      "sources": sourceId,
      "q":searchkey,
      "language":currentLang,

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
