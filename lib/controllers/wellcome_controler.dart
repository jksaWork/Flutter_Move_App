import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movies_app/views/Home/Home.dart';
import 'package:movies_app/views/Settings/settings.dart';
import 'package:movies_app/views/genres/grens.dart';

class WelcomeController extends GetxController {
  var currentIndex = 0.obs;

  List<Widget> screens = [
    Home(),
    Settings(),
    GenrePage(),
    Settings(),
  ];
}
