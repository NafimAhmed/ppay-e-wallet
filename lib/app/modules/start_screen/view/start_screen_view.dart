import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/util/app_color.dart';

import '../../../routes/app_pages.dart';
import '../../../util/app_constant.dart';
import '../../../util/app_local_stroge.dart';
import '../../../util/app_size.dart';
import '../../../widgets/submission_button.dart';
import '../controllers/start_screen_controller.dart';

class StartScreenView extends GetView<StartScreenController> {
  const StartScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              kStartScreenLogo,
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15.0),
              child: SubmissionButton(
                text: 'Get Started',
                onTap: () {
                  checkLoginStatus();
                },
                height: screenHeight * 0.075,
                width: screenWidth,
                color: AppColors.colorBlue,
                borderRadius: 10,
                textStyle: GoogleFonts.manrope(
                    fontSize: screenHeight * 0.020,
                    fontWeight: FontWeight.bold
                ),
                borderColor: AppColors.colorBlue,
              ),
            )
          ],
        ));
  }


  checkLoginStatus() async {
    var loginStatus = await getStorage.read('loginStatus');
    debugPrint("status ......."+loginStatus.toString());
    if (loginStatus.toString() == "false" || loginStatus.toString() == "null") {

      return Get.offNamed(Routes.START_SCREEN_CAROSEL);

    } else {
      return Get.offNamed(Routes.BASE);
    }
  }
}