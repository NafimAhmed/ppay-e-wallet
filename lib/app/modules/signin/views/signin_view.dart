import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:p_pay/app/util/app_color.dart';
import 'package:p_pay/app/util/app_size.dart';
import 'package:p_pay/app/widgets/app_snackbar.dart';

import '../../../widgets/arrow_back_button.dart';
import '../../../widgets/indicator_line.dart';
import '../../../widgets/loder.dart';
import '../../../widgets/submission_button.dart';
import '../controllers/signin_controller.dart';
import 'otp_view.dart';

class SigninView extends GetView<SigninController> {
  SigninView({Key? key}) : super(key: key);

  final SigninController controler = Get.put(SigninController());

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
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
                    const IndicatorLine(percent: 0.1428,),
                    SizedBox(
                      height: screenHeight * 0.020,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.040),
                      child: Text(
                        'What’s your number?',
                        style: GoogleFonts.inter(
                            color: AppColors.colorBlack,
                            fontWeight: FontWeight.w700,
                            fontSize: screenHeight * 0.022
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.010,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.040),
                      child: SizedBox(
                        width: screenWidth - 50,
                        child: Text(
                          'You will receive a verification code so make sure it is active',
                          maxLines: 2,
                          style: GoogleFonts.inter(
                            color: AppColors.colorBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: screenHeight * 0.030,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15,
                          right: 15
                      ),
                      child: SizedBox(
                        width: screenWidth,
                        child: IntlPhoneField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.colorLightGrey
                              ),
                            ),
                            counterText: '',

                          ),
                          initialCountryCode: 'BD',
                          onChanged: (phone) {
                            controler.mobileNumber.value = phone.completeNumber;
                            // print(phone.completeNumber);
                          },
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),
                          dropdownTextStyle: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0,right: 35.0),
                      child: SubmissionButton(
                        text: 'Next',
                        onTap: () {
                           controler.otpSender();


                          if(controler.mobileNumber.value.isNotEmpty){
                            //Get.to(() => OtpView());
                            Get.to(() => OtpView());
                          }

                          else{
                            showSnackBar('Warning', 'Your phone Number is empty', Colors.red, SnackPosition.BOTTOM);
                            // Get.snackbar('Warning', 'Your phone Number is empty',
                            //   snackPosition: SnackPosition.BOTTOM,
                            //   margin: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
                            //   backgroundColor: Colors.deepOrange
                            // );
                          }


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
                ),
              ),
              Obx(() =>  controller.isOTPLoading.value == true ?
              const Center(
                child: AppLoder(),
              ) : Container())
            ],
          )
      ),
    );
  }
}
