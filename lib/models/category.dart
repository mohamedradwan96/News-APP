import 'dart:ui';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Category {
  String id;

  String title;

  String image;

  Color colorBg;

  Category(this.id, this.title, this.image, this.colorBg);

  static List<Category> getCategories(context) {
    return [
      Category("sports", AppLocalizations.of(context)!.sports,
          "assets/images/sports.png", const Color(0xffC91C22)),
      Category("health", AppLocalizations.of(context)!.health,
          "assets/images/health.png", const Color(0xffed1e79)),
      Category("business", AppLocalizations.of(context)!.business,
          "assets/images/bussines.png", const Color(0xffcf7e48)),
      Category("science", AppLocalizations.of(context)!.science,
          "assets/images/science.png", const Color(0xfff2d352)),
      Category("entertainment", AppLocalizations.of(context)!.entertainment,
          "assets/images/entertainment.png", const Color(0xff4882cf)),
      Category("technology", AppLocalizations.of(context)!.technology,
          "assets/images/technology.png", const Color(0xff8f5a6a)),
      Category("general", AppLocalizations.of(context)!.general,
          "assets/images/general.png", const Color(0xff4f965f)),
    ];
  }
}
