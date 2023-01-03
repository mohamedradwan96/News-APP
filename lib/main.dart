import 'package:flutter/material.dart';
import 'package:news/provider/app_provider.dart';
import 'package:news/screens/newsDetails.dart';
import 'package:news/screens/settings/setting.dart';
import 'package:news/shared/styel/mytheme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'layout/home_layout.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (buildContext) => MyProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: Homelayout.routeName,
      routes: {
        Homelayout.routeName: (context) => Homelayout(),
        NewsDetailsScreen.routeName: (context) => NewsDetailsScreen(),
        SettingsTab.routeName: (context) => SettingsTab(),
      },
      theme: MyThemeData.lightTheme,
      locale: Locale(settingsProvider.languageCode),
    );
  }
}
