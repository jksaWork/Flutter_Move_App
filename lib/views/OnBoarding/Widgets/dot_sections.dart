// import 'dart:js';

import 'package:movies_app/controllers/on_boarding_controller.dart';
import 'package:movies_app/core/Constrant/AppColors.dart';
import 'package:movies_app/data/Source/Static/on_board_list.dart';
import 'package:movies_app/views/OnBoarding/Widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class DotSections extends StatelessWidget {
  const DotSections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DotSectionsFun();
  }
}

Container DotSectionsFun() {
  return Container(
      child: Column(
    children: [
      Container(child: GetBuilder<onBoardingController>(builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                onBoardingList.length,
                (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      margin: const EdgeInsets.all(5),
                      width: controller.currentIndex == index ? 25 : 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    ))
          ],
        );
      })),
      SizedBox(height: 20),
      NextButton(),
    ],
  ));
}

// GestureDetector 
