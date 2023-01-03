import 'package:flutter/material.dart';
import 'package:news/shared/styel/colors.dart';

import '../models/NewsResponse.dart';
import '../models/category.dart';
import '../models/search.dart';
import '../screens/category_screen.dart';
import '../screens/drawer_menu.dart';
import '../screens/homescreen.dart';

class Homelayout extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<Homelayout> createState() => _HomelayoutState();
}

class _HomelayoutState extends State<Homelayout> {
  @override
  Widget build(BuildContext context) {
    List<Articles> articles = [];
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
              title: const Text("TIMES news"),
              backgroundColor: primaryColor,
              actions: [
                InkWell(
                    child: IconButton(
                        onPressed: () {
                          showSearch(
                              context: context, delegate: SearchData(articles));
                        },
                        icon: const Icon(Icons.search)))
              ],
              shape: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35)))),
        ),
        drawer: DrawerScreen(openDrawer),
        body: selectedCategoryItem == null
            ? CategoriesScreen(selectedCategoryCallBack)
            : HomeScreen(selectedCategoryItem!),
      ),
    );
  }

  Category? selectedCategoryItem = null;

  void openDrawer(selectedNumber) {
    if (selectedNumber == DrawerScreen.CATEGORY_NUMBER) {
      selectedCategoryItem = null;
    } else if (selectedNumber == DrawerScreen.SETTINGS_NUMBER) {}
    setState(() {
      Navigator.pop(context);
    });
  }

  void selectedCategoryCallBack(Category category) {
    selectedCategoryItem = category;
    setState(() {});
  }
}
