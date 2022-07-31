import 'package:movies_app/core/Constrant/AppImages.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvgImg {
  // static var mail = Sc
  static SvgPicture mail = SvgPicture.asset('assets/icons/Mail.svg');
  static SvgPicture Lock = SvgPicture.asset(
    'assets/icons/Lock.svg',
    color: Colors.red,
  );

  static SvgPicture facebook = SvgPicture.asset(
    'assets/icons/facebook-2.svg',
    width: 20,
  );

  static SvgPicture google = SvgPicture.asset(
    'assets/icons/google-icon.svg',
    width: 20,
  );
  static SvgPicture tweiter = SvgPicture.asset(
    'assets/icons/twitter.svg',
    width: 20,
  );
  static SvgPicture phone = SvgPicture.asset(
    'assets/icons/Phone.svg',
  );
}
