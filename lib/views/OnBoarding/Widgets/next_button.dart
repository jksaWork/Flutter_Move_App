import 'package:movies_app/controllers/on_boarding_controller.dart';
import 'package:movies_app/core/Constrant/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class NextButton extends GetView<onBoardingController> {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(controller.OnBoardingLength > controller.currentIndex + 1);
        controller.next();
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          // height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColor.primaryColor,
          ),
          child: GetBuilder<onBoardingController>(builder: (context) {
            return Center(
              child: controller.OnBoardingLength > controller.currentIndex + 1
                  ? Text(
                      'Next Step',
                      style: TextStyle(color: Colors.white),
                    )
                  : Text(
                      'Got It',
                      style: TextStyle(color: Colors.white),
                    ),
            );
          })),
    );
  }
}
