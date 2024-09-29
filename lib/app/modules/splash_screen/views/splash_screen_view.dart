import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:p_pay/app/routes/app_pages.dart';

import '../../../util/app_constant.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    Timer(const Duration(milliseconds: 3000), () {
      Get.offNamed(Routes.START_SCREEN);
    });

    return Scaffold(
        body: Center(
          child: SvgPicture.asset(
            kStartScreenLogo,
            height: 200,
            width: 200,
          ),
        ));
  }
}
