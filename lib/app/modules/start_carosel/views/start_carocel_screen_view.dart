import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/modules/start_screen/controllers/start_screen_controller.dart';
import 'package:p_pay/app/routes/app_pages.dart';
import 'package:p_pay/app/util/app_color.dart';
import 'package:p_pay/app/util/app_size.dart';
import 'package:p_pay/app/widgets/carousel.dart';
import 'package:p_pay/app/widgets/slider_tile.dart';
import 'package:p_pay/app/widgets/submission_button.dart';

import '../../../util/app_constant.dart';

class StartCaroselScreenView extends GetView<StartScreenController> {
  const StartCaroselScreenView({super.key});



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PrimarCarousel(
            itemList: const [
              SliderTile(
                  imageLink: kOnBordingScreen1Svg,
                  title: "Easy,Fast & Trusted",
                  subTitle:
                      'Fast money transfer and guaranteed safe transactions with others.'),
              SliderTile(
                  imageLink: kOnBordingScreen2Svg,
                  title: "Saving Your Money",
                  subTitle:
                      'Track the progress of your savings and start a habit of saving with TransferMe.'),
              SliderTile(
                  imageLink:  kOnBordingScreen3Svg,
                  title: "Multiple Credit Cards",
                  subTitle:
                      'Provides the 100% freedom of the financial management with Multiple Payment Options.'),
            ],
            height: screenHeight * 0.500,
            dotColor: AppColors.colorBlue,
          ),

          SizedBox(
            height: screenHeight * 0.050,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SubmissionButton(
                text: 'Login',
                onTap: () {
                  Get.offNamed(
                    Routes.LOGIN
                  );
                },
                height: 40,
                width: screenWidth * 0.350,
                color: AppColors.colorLightWhite,
                borderRadius: 30,
                borderColor: AppColors.colorBlue,
                textStyle: GoogleFonts.poppins(
                  color: AppColors.colorLightBlue,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,

                ),
              ),

               SizedBox(width: screenWidth * 0.050,),

              SubmissionButton(
                text: 'Sign Up',
                onTap: () {
                  Get.offNamed(
                      Routes.SIGNIN
                  );
                },
                height: 40,
                width: screenWidth * 0.350,
                color: AppColors.colorLightBlue,
                borderRadius: 30,
                borderColor: AppColors.colorBlue,
                textStyle: GoogleFonts.poppins(
                  color: AppColors.colorLightWhite,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,

                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
