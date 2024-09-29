// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/modules/signin/views/personal_info.dart';
import 'package:p_pay/app/util/password_validation.dart';
import 'package:p_pay/app/widgets/app_snackbar.dart';

import '../../../util/app_color.dart';
import '../../../util/app_size.dart';
import '../../../widgets/arrow_back_button.dart';
import '../../../widgets/box_text_field.dart';
import '../../../widgets/indicator_line.dart';
import '../../../widgets/submission_button.dart';
// import '../../profile_setting/views/profile_setting_view.dart';
import '../controllers/signin_controller.dart';

class LoginAfterOtp extends GetView<SigninController>  {
  LoginAfterOtp({super.key});



  @override
  Widget build(BuildContext context) {

    Rx<Color> passColor = Colors.transparent.obs;

    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.020,
                  left: screenWidth * 0.040),
              child: const ArrowBackButton(),
            ),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            const IndicatorLine(percent: 0.4285,),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.040),
              child: Text(
                'How you’ll log in',
                style: GoogleFonts.poppins(
                    color: AppColors.colorBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.027
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.010,
            ),
            SizedBox(
              height: screenHeight * 0.010,
            ),

            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.040),
              child: Text(
                'Ensure that you maintain its security',
                style: GoogleFonts.poppins(
                    color: AppColors.colorBlack,
                    fontSize: screenHeight * 0.017
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15.0),
              child: BoxTextField(
                textEditingController: controller.emailController, labelName: 'Email Address', controller: controller,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                child: Obx(() => Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: passColor.value,width: 1),
                      borderRadius: BorderRadius.circular(10)
                  ),

                  child: BoxTextField(
                    textEditingController: controller.passwordController, labelName: 'Password', controller: controller,
                  ),
                ),)


            ),

            SizedBox(
              height: screenHeight * 0.020,
            ),

            SizedBox(
              height: screenHeight * 0.070,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35.0,right: 35.0),
              child: SubmissionButton(
                text: 'Next',
                onTap: () {

                  if(controller.emailController.text == "" && controller.passwordController.text == ""){
                    showSnackBar('Warming', "Please fill all the field", Colors.orangeAccent, SnackPosition.BOTTOM);
                  }

                  else if(controller.emailController.text == "" || controller.passwordController.text == ""){
                    showSnackBar('Warming', "Please fill all the field", Colors.orangeAccent, SnackPosition.BOTTOM);
                  }

                  else if(controller.passwordController.text.length < 8){
                    showSnackBar('Warming', "password should be 8 digits at least", Colors.orangeAccent, SnackPosition.BOTTOM);
                  }

                  else if(PasswordValidation().isPasswordValid(controller.passwordController.text)){

                    Get.to(
                            ()=> const PersonalInfo() //() => const ProfileSettingView()
                    );

                  }
                  else{
                    showSnackBar('Caution', "Please Use Capital letter, Small latter, numarical characters and \n Special Characters (!@#%^&*(),.?\":{}|<>) in your password", Colors.red, SnackPosition.BOTTOM);
                    //passColor.value=Colors.red;
                  }


                },
                height: screenHeight * 0.075,
                width: screenWidth,
                color: AppColors.colorLightBlue,
                borderRadius: 5.0,
                textStyle: GoogleFonts.manrope(
                    fontSize: screenHeight * 0.020,
                    fontWeight: FontWeight.bold
                ),
                borderColor: AppColors.colorBlue,
              ),
            )

          ],
        ),
      ),
    ));
  }
}
