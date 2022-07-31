import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/Services/api.dart';
import 'package:movies_app/views/Themes/appTheme.dart';
import 'package:movies_app/views/maps/maps.dart';
import 'package:movies_app/views/splash_Screen/SplachScreen.dart';
import 'dart:convert' as convert;

void main() async {
  await GetStorage.init();
  Api.initilzieIntercepters();

  // HttpTest();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.white),
        primarySwatch: Colors.blue,
      ),
      home: SplachScreen(),
    );
  }
}
