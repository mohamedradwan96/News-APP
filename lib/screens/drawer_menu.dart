import 'package:flutter/material.dart';
import 'package:news/screens/settings/setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerScreen extends StatelessWidget {
  Function drawerAction;
  static int CATEGORY_NUMBER = 1;
  static int SETTINGS_NUMBER = 2;

  DrawerScreen(
    this.drawerAction,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .60,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: Colors.green,
            ),
            child: const Center(
                child: Text(
              "TIMES\nnews",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  drawerAction(CATEGORY_NUMBER);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.category,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      AppLocalizations.of(context)!.category,
                      style: const TextStyle(fontSize: 26),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SettingsTab.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.settings,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      AppLocalizations.of(context)!.settings,
                      style: const TextStyle(fontSize: 26),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
