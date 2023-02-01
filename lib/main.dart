import 'package:flutter/material.dart';
import 'package:news/layout/home_layout.dart';
import 'package:news/modules/homeScreen.dart';
import 'package:news/modules/categoriesScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:homeLayout.routeName ,
      routes: {
        homeLayout.routeName:(context) => homeLayout(),
      },
    );
  }
}
