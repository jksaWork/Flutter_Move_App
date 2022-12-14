import 'package:movies_app/core/Constrant/AppColors.dart';
import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final Function()? press;
  const ContinueButton({Key? key, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
          onTap: press,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColor.primaryColor,
            ),
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.all(10),
            child: Text(
              "Continue",
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}
