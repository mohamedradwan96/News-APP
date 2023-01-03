import 'package:flutter/material.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/screens/tab_items.dart';
import 'package:news/shared/network/remote/apiManger.dart';
import 'package:news/shared/styel/colors.dart';
import 'package:provider/provider.dart';

import '../models/NewsResponse.dart';
import '../provider/app_provider.dart';
import 'news_items.dart';

class TabControllerScreen extends StatefulWidget {
  List<Sources> sources;

  TabControllerScreen(this.sources);

  @override
  State<TabControllerScreen> createState() => _TabControllerScreenState();
}

class _TabControllerScreenState extends State<TabControllerScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<MyProvider>(context);
    return DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              indicatorColor: Colors.transparent,
              onTap: (index) {
                selectedindex = index;
                setState(() {});
              },
              isScrollable: true,
              labelColor: primaryColor,
              tabs: widget.sources
                  .map((source) => TabItem(
                      source,
                      selectedindex == widget.sources.indexOf(source)
                          ? true
                          : false))
                  .toList(),
            ),
            FutureBuilder<NewsResponse>(
              future: ApiManger.GetNews(sourceId:widget.sources[selectedindex].id,currentLang:settingsProvider.languageCode ),
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
            )
          ],
        ));
  }
}
