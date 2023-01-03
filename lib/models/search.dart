import 'package:flutter/material.dart';

import '../screens/news_items.dart';
import '../shared/network/remote/apiManger.dart';
import 'NewsResponse.dart';


class SearchData extends SearchDelegate{
  List<Articles> articles;
  SearchData(this.articles);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
       IconButton(onPressed: (){
         query=' ';
       },
           icon:const Icon(Icons.close))
    ];

  }

  @override
  Widget? buildLeading(BuildContext context) {
   return  IconButton(onPressed: (){
     close(context, null);
   }, icon:const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManger.GetNews(searchkey: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                const Text("Something Went Wrong "),
                TextButton(
                    onPressed: () {}, child: const Text("Try Again")),
              ],
            ),
          );
        }
        var newsdata = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.builder(
            itemCount: newsdata.length,
            itemBuilder: (context, index) {
              return NewsItems(newsdata[index]);
            },
          ),
        );
      },
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Text(articles[index].title!);
        },);

  }
}