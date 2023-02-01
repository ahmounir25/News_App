import 'package:flutter/material.dart';

import 'colors.dart';

class myThemeData {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: greenColor,
      appBarTheme: AppBarTheme(
        backgroundColor: blueColor
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        headline2: TextStyle(fontSize: 20, color: Colors.black),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor:blueColor,
        unselectedItemColor: Colors.black,
      ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: blueColor,
    )

  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: onPrimaryDarkcolor,
          onPrimary: primaryDarkcolor,
          secondary: primaryDarkcolor,
          onSecondary: onPrimaryDarkcolor,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.transparent,
          onBackground: onPrimaryDarkcolor,
          surface: primaryDarkcolor,
          onSurface: Colors.white),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        headline2: TextStyle(fontSize: 20, color: Colors.white),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primaryDarkcolor,
        selectedItemColor: onPrimaryDarkcolor,
        unselectedItemColor: Colors.white,
      ));
}
