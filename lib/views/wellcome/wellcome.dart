import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controllers/wellcome_controler.dart';

class WellcomeScreen extends StatelessWidget {
  const WellcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WelcomeController());
    return Obx(
      () => Scaffold(
        body: controller.screens[controller.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              // print(index);
              controller.currentIndex.value = index;
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'setting'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'genres'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'as'),
            ]),
      ),
    );
  }
}
