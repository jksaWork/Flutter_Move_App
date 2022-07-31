import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData darkTheme() {
    return getDarkTheme();
  }

  static ThemeData lightTheme() {
    return getLightTheme();
  }
}

ThemeData getDarkTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.blue,
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      // iconTheme: IconThemeData(color: Colors.black),
      // color: Colors.blue,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.amber,
      secondary: Colors.amber,
      brightness: Brightness.dark,
    ),
  );
}

ThemeData getLightTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.blue,
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      // iconTheme: IconThemeData(color: Colors.black),
      // color: Colors.blue,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.amber,
      secondary: Colors.amber,
    ),
  );
}
