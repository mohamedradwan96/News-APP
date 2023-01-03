import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoriesItems extends StatelessWidget {
  Category category;
  int index;

  CategoriesItems(this.category, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomRight: index % 2 == 0
                ? const Radius.circular(0)
                : const Radius.circular(20),
            bottomLeft: index % 2 != 0
                ? const Radius.circular(0)
                : const Radius.circular(20),
          ),
          color: category.colorBg),
      child: Column(
        children: [
          Expanded(child: Image.asset(category.image)),
          Text(
            category.title,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
