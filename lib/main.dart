import 'package:flutter/material.dart';
import 'package:news/shared/styel/mytheme.dart';

import 'layout/home_layout.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Homelayout.routeName ,
      routes: {
        Homelayout.routeName:(context)=>Homelayout(),
      },
      theme: MyThemeData.lightTheme,

    );
  }
}

