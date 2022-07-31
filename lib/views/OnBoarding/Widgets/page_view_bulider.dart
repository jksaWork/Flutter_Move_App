import 'package:movies_app/controllers/on_boarding_controller.dart';
import 'package:movies_app/data/Models/OnBardingModel.dart';
import 'package:movies_app/data/Source/Static/on_board_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewSections extends GetView<onBoardingController> {
  const PageViewSections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .7,
      child: PageView.builder(
          controller: controller.pageController,
          onPageChanged: (val) {
            controller.onPageChanched(val);
          },
          itemCount: onBoardingList.length,
          itemBuilder: (context, i) {
            OnBoardModel item = onBoardingList[i];
            return Container(
              // color: Colors.red,
              // height: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    item.title!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: Image.asset(
                      item.image!,
                      width: 200,
                      height: 250,
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        item.body!,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
