import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/category.dart';
import 'category_items.dart';

class CategoriesScreen extends StatelessWidget {
  Function callBack;

  CategoriesScreen(this.callBack);

  @override
  Widget build(BuildContext context) {
    var categories = Category.getCategories(context);
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.pickYourCategory,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const Icon(Icons.category)
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: GridView.builder(
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 1, mainAxisSpacing: 1),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    callBack(categories[index]);
                  },
                  child: CategoriesItems(categories[index], index));
            },
          ),
        ),
      ],
    );
  }
}
