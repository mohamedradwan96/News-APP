import 'package:flutter/material.dart';
import 'package:news/models/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/styel/colors.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = "NewsDetailsScreen";

  @override
  Widget build(BuildContext context) {
    var articles = ModalRoute.of(context)!.settings.arguments as Articles;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image:DecorationImage(image: AssetImage("assets/images/background.png"),fit: BoxFit.cover
      )),
      child: Scaffold(
    backgroundColor: Colors.transparent,
          appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
            title:  Text(
              articles.title??" ",
              style: TextStyle(fontSize: 16),
            ),
            backgroundColor: primaryColor,
            shape: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35)))),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            const SizedBox(height: 6),
            Image.network(
              articles.urlToImage ?? "",
              height: 180,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 6),
            Container(
              margin: const EdgeInsets.only(left: 5),
              alignment: Alignment.topLeft,
              child: Text(
                  textAlign: TextAlign.start,
                  articles.author ?? "",
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
                textAlign: TextAlign.center,
                articles.title ?? "",
                style: const TextStyle(fontSize: 20, color: Colors.black)),
            const SizedBox(
              height: 3,
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                  textAlign: TextAlign.left,
                  articles.publishedAt!.substring(0, 10),
                  style: const TextStyle(fontSize: 14, color: Colors.black45)),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              color:Colors.black,
              height: 2,
              width: double.infinity,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Center(
                child: (
                Text(articles.content??" ",style:Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 18),)
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: (){
                openUrl(articles.url);

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text("View Full Article",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                  Icon(Icons.double_arrow_outlined),
                ],
              ),
            )
          ],
        ),
      ),

      ),
    );
  }
  void openUrl(String? url)async{
    if(url==null){
      return;
    }
    var uri = Uri.parse(url);
    if(await canLaunchUrl(uri)){
     await launchUrl(uri);
    }
  }
}
