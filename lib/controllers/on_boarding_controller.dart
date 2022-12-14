import 'package:movies_app/core/Services/my_services.dart';
import 'package:movies_app/data/Source/Static/on_board_list.dart';
import 'package:movies_app/views/auth/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

abstract class onBoardingAbs extends GetxController {
  next();
  onPageChanched(int index);
}

class onBoardingController extends onBoardingAbs {
  int currentIndex = 0;
  int OnBoardingLength = onBoardingList.length;
  late PageController pageController;

  MyServices service = Get.find();

  @override
  next() {
    // print('go to next Fun');
    if (currentIndex + 1 == OnBoardingLength) {
      service.sharedPreferences.setBool('first_time', true);
      Get.offAllNamed(Login.routeName);
    }
    currentIndex++;
    pageController.animateToPage(currentIndex,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    print('page View');
  }

  @override
  onPageChanched(int index) {
    currentIndex = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
