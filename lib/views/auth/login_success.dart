import 'package:movies_app/core/Shared/app_bars.dart';
import 'package:movies_app/views/Home/Home.dart';
import 'package:movies_app/views/auth/widgets/contiue_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogginSuccess extends StatelessWidget {
  static String routeName = '/LogginSuccess';
  const LogginSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarWithNowBackArrow(context, "Login Successfuly"),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/success.png'),
              Text('Login Successfly'),
              ContinueButton(press: () {
                Get.to(Home());
              })
            ],
          )),
    );
  }
}
