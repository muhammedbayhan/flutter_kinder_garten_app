import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/product/utility/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Anaokulu Uygulaması',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('tr'), // Turkish
        Locale('en'), // English
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: ColorsP.scaffoldColor,
            elevation: 0,
            iconTheme: IconThemeData(color: ColorsP.black)),
        scaffoldBackgroundColor: ColorsP.scaffoldColor,
        fontFamily: "Lexend",
        colorScheme: ColorScheme.fromSeed(seedColor: ColorsP.primary),
        useMaterial3: false,
      ),
      getPages: AppRoutes.routes,
    );
  }
}
