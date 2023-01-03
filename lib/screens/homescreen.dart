import 'package:flutter/material.dart';
import 'package:news/screens/tabController.dart';

import '../models/SourcesResponse.dart';
import '../models/category.dart';
import '../shared/network/remote/apiManger.dart';

class HomeScreen extends StatelessWidget {
  Category category;
  HomeScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiManger.GetSourse( category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                const Text("Something Went Wrong "),
                TextButton(onPressed: () {}, child: const Text("Try Again")),
              ],
            ),
          );
        }

        var sources = snapshot.data?.sources ?? [];
        return Container(
            margin: const EdgeInsets.all(10),
            child: TabControllerScreen(sources));
      },
    );
  }
}
