import 'package:flutter/material.dart';
import 'package:learn2/pages/home.dart';
import 'package:learn2/pages/setting.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      // Mendaftarkan route setiap page
      routes: {
        HomePage.routeName: (context) => HomePage(),
        SettingPage.routeName: (context) => SettingPage(),
      },
    );
  }
}
