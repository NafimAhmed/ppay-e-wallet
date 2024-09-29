// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/util/app_color.dart';
// import 'package:p_pay/app/widgets/app_snackbar.dart';
import '../../../util/app_constant.dart';
import '../../../util/app_size.dart';
import '../../../widgets/arrow_back_button.dart';
import '../../../widgets/indicator_line.dart';
import '../../../widgets/loder.dart';
import '../../../widgets/submission_button.dart';
import '../controllers/signin_controller.dart';
import 'login_after_otp.dart';

class OtpView extends GetView<SigninController> {
  OtpView({Key? key}) : super(key: key);

  @override
  SigninController controler = Get.put(SigninController());


  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Scaffold(
          body:
          Stack(
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
                    const IndicatorLine(percent: 0.2857,),
                    SizedBox(
                      height: screenHeight * 0.020,
                    ),
                    Center(
                      child: SvgPicture.asset(
                        kOtpImg,
                        // height: screenHeight * 0.32,

                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.010,
                    ),
                    Center(
                      child: Text(
                        "OTP Verification",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: screenHeight * 0.030,
                            color: AppColors.colorBlack
                        ),
                      ),
                    ),
                    Center(
                      child:
                      RichText(
                        text:  TextSpan(
                          text: 'Enter the OTP sent to ',
                          style: GoogleFonts.poppins(
                            // fontWeight: FontWeight.w600,
                              fontSize: screenHeight * 0.014,
                              color: AppColors.colorBlack),
                          children: <TextSpan>[
                            TextSpan(
                              text: controler.mobileNumber.value,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenHeight * 0.014,
                                color: AppColors.colorBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.020,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20,
                            right: 20
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                height: 50,
                                width: screenWidth * 0.15,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  controller: controler.otpController1,

                                  style: GoogleFonts.poppins(
                                      fontSize: screenHeight * 0.030,
                                      fontWeight: FontWeight.bold
                                  ),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  autofocus: true,

                                  onChanged: (v){
                                    if(v.isNotEmpty) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },

                                )
                            ),

                            SizedBox(
                                height: 50,

                                width: screenWidth * 0.15,
                                child: TextFormField(
                                  controller: controler.otpController2,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: screenHeight * 0.030,
                                      fontWeight: FontWeight.bold
                                  ),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  autofocus: true,
                                  onChanged: (v){

                                    if(v.isNotEmpty){
                                      FocusScope.of(context).nextFocus();}

                                  },
                                )
                            ),
                            SizedBox(
                                height: 50,
                                width: screenWidth * 0.15,
                                child: TextFormField(
                                  controller: controler.otpController3,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: screenHeight * 0.030,
                                      fontWeight: FontWeight.bold
                                  ),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  autofocus: true,
                                  onChanged: (v){
                                    if(v.isNotEmpty){
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },



                                )
                            ),
                            SizedBox(
                                height: 50,
                                width: screenWidth * 0.15,
                                child: TextFormField(
                                  controller: controler.otpController4,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: screenHeight * 0.030,
                                      fontWeight: FontWeight.bold
                                  ),


                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  autofocus: true,

                                  onChanged: (v){

                                  },



                                )
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.020,
                    ),
                    Center(
                      child:   RichText(
                        text:  TextSpan(
                          text: 'Didn’t you receive the OTP ? ',
                          style: GoogleFonts.poppins(
                            // fontWeight: FontWeight.w600,
                              fontSize: screenHeight * 0.014,
                              color: AppColors.colorBlack),
                          children: <TextSpan>[
                            TextSpan(
                              text: " Resend OTP",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenHeight * 0.014,
                                color: AppColors.colorBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.040,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0,right: 35.0),
                      child: SubmissionButton(
                        text: 'Next',
                        onTap: () {
                          // controler.userOtpVerify();
                          Get.off(() => LoginAfterOtp());
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