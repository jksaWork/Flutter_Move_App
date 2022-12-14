import 'package:movies_app/controllers/auth/register_controller.dart';
import 'package:movies_app/core/Constrant/AppSvgImg.dart';
import 'package:movies_app/core/Functions/vaidate_input.dart';
import 'package:movies_app/core/Shared/app_bars.dart';
import 'package:movies_app/views/auth/register/completed_profile.dart';
import 'package:movies_app/views/auth/widgets/Social_links.dart';
import 'package:movies_app/views/auth/widgets/auth_page_heading.dart';
import 'package:movies_app/views/auth/widgets/contiue_button.dart';
import 'package:movies_app/views/auth/widgets/custom_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  static String routeName = '/register';

  const Register({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    registerController controller = Get.put(registerController());
    return Scaffold(
      appBar: BarWithArrow(context, ' Compleated Profile'),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: ListView(children: [
          AuthPageHeading(
              head: 'Register Account',
              description:
                  'Type Your Account Inforamtion And Join To  to Thiget" in commerce.s He'),
          Container(
            child: Column(
              children: [
                CustomTextFiled(
                    validator: (val) => validInput(val!, 8, 30, ''),
                    controller: controller.email,
                    title: 'Email',
                    prefiexIcon: AppSvgImg.mail),
                CustomTextFiled(
                    validator: (val) => validInput(val!, 8, 30, ''),
                    controller: controller.password,
                    title: 'Password',
                    prefiexIcon: AppSvgImg.Lock),
                CustomTextFiled(
                    validator: (val) => validInput(val!, 8, 30, ''),
                    controller: controller.password,
                    title: 'Confirm Password',
                    prefiexIcon: AppSvgImg.Lock),
                // SizedBox(height: 10),
                ContinueButton(press: () {
                  // print('tabed 5 imes ');
                  Get.toNamed(CompletedProfile.routeName);
                }),
                SocialLinks(),
              ],
            ),
          ),
        ]),
        //
      ),
    );
  }
}
