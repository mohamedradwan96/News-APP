import 'package:flutter/material.dart';
import 'package:news/models/NewsResponse.dart';

import '../shared/styel/colors.dart';

class NewsItems extends StatelessWidget {
 Articles articles;
  NewsItems(this.articles);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 6),
        Image.network(articles.urlToImage??"",
        height:180,
        width: double.infinity,
        fit: BoxFit.fill,),
        const SizedBox(height: 6),
        Container(
          margin: EdgeInsets.only(left: 5),
          alignment: Alignment.topLeft,
          child: Text(

              textAlign:TextAlign.start,
              articles.author??"",style: TextStyle( fontSize: 16,color:Colors.grey,fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 3,),
        Text(
          textAlign: TextAlign.center,
            articles.title??"",style: const TextStyle(fontSize: 20,color:Colors.black)),
        const SizedBox(height: 3,),
        Container(
          alignment: Alignment.bottomRight,
          child: Text(
              textAlign:TextAlign.left,
              articles.publishedAt!.substring(0,10),style: TextStyle(fontSize: 14,color:Colors.black45)),
        ),
        const SizedBox(height: 6,)
      ],

    );
  }
}
