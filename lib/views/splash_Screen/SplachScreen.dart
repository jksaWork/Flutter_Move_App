import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movies_app/controllers/auth_controller.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authControoler = Get.put(AuthController());
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Moveis App',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      )),
    );
  }
}
