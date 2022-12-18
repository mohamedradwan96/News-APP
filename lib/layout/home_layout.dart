import 'package:flutter/material.dart';

import '../screens/homescreen.dart';



class Homelayout extends StatelessWidget {
static const String routeName ="HomeScreen";

  const Homelayout({super.key});
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
          color: Colors.white,
        image: DecorationImage(image: AssetImage("assets/images/background.png"),fit:BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
              title:  const Text("TIMES news"),
            actions: [
              Container(
                  margin: const EdgeInsets.only(right: 12,top: 12),
                  child: const InkWell(
                      child: Icon(Icons.search)))
            ],
            shape:const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35)
            ))
          ),
        ),
        drawer: const Drawer(),
        body:const HomeScreen()

      ),
    );
  }
}
