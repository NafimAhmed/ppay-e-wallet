



// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/widgets/app_snackbar.dart';
import 'package:p_pay/app/widgets/loder.dart';
// import 'package:p_pay/app/modules/signin/views/add_credit_card.dart';

import '../../../routes/app_pages.dart';
import '../../../util/app_color.dart';
import '../../../util/app_size.dart';
import '../../../widgets/arrow_back_button.dart';
import '../../../widgets/box_text_field.dart';
import '../../../widgets/indicator_line.dart';
import '../../../widgets/submission_button.dart';
import '../controllers/signin_controller.dart';

class AddressSetting extends GetView<SigninController>  {
  AddressSetting({super.key});

  @override





  @override
  Widget build(BuildContext context) {

    RxBool isChecked1=false.obs;
    RxBool isChecked2=false.obs;

    return SafeArea(child: Scaffold(
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
                  const IndicatorLine(percent: 0.7142,),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.040),
                    child: Text(
                      'Add your address',
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
                      "Use the one that's on your bills.",
                      style: GoogleFonts.poppins(
                          color: AppColors.colorBlack,
                          fontSize: screenHeight * 0.017
                      ),
                    ),
                  ),





                  // SizedBox(
                  //   height: screenHeight * 0.020,
                  // ),


                  // Padding(
                  //   padding:  const EdgeInsets.only(left: 15.0,right: 15.0),
                  //   child: BoxDropdown(menuItem: ['Malean','Bangladeshi','British','Scotish'], hintText: 'Nationality'),
                  // ),


                  SizedBox(
                    height: screenHeight * 0.020,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                    child: BoxTextField(
                      textEditingController: controller.addressLine1Controller, labelName: 'Street name and house number', controller: controller,
                    ),
                  ),


                  SizedBox(
                    height: screenHeight * 0.020,
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                    child: BoxTextField(
                      textEditingController: controller.addressLine2Controller, labelName: 'Address line 2', controller: controller,
                    ),
                  ),

                  // SizedBox(
                  //   height: screenHeight * 0.020,
                  // ),
                  //
                  //
                  // Padding(
                  //   padding:  const EdgeInsets.only(left: 15.0,right: 15.0),
                  //   child: BoxDropdown(menuItem: ['NID','Passport','Birth certificate'], hintText: 'Document Type'),
                  // ),

                  SizedBox(
                    height: screenHeight * 0.020,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                    child: BoxTextField(
                      textEditingController: controller.postCodeController, labelName: 'Postcode', controller: controller,
                    ),
                  ),

                  // SizedBox(
                  //   height: screenHeight * 0.020,
                  // ),
                  //
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                  //   child: BoxTextField(
                  //     textEditingController: controller.emailController, labelName: 'Date of Birth', controller: controller,
                  //   ),
                  // ),

                  const SizedBox(height: 20,),

                  Obx(() => Padding(
                    padding: const EdgeInsets.only(
                      left: 2.0,
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: AppColors.colorLightWhite,
                          activeColor: AppColors.colorBlue,
                          value: isChecked1.value,
                          onChanged: (bool? value) {
                            isChecked1.value = value!;
                          },
                        ),
                        SizedBox(
                          width: screenWidth-50,
                          child: Text(
                            "Receive news and offers from P-Pay. You can change this setting whenever you want.",
                            maxLines: 3,
                            style: GoogleFonts.poppins(
                                fontSize: screenHeight * 0.018,
                                color: AppColors.colorLightGrey
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),),


                  const SizedBox(height: 20,),

                  Obx(() => Padding(
                    padding: const EdgeInsets.only(
                      left: 2.0,
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: AppColors.colorLightWhite,
                          activeColor: AppColors.colorBlue,
                          value: isChecked2.value,
                          onChanged: (bool? value) {
                            isChecked2.value = value!;
                          },
                        ),
                        SizedBox(
                          width: screenWidth-50,
                          child: Text(
                            "You confirm that you have read, consent and agree to P-Pay User Agreement and Privacy Statement and you are of legal age.",
                            style: GoogleFonts.poppins(
                                fontSize: screenHeight * 0.018,
                                color: AppColors.colorLightGrey
                            ),
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  ),),










                  // SizedBox(
                  //   height: screenHeight * 0.020,
                  // ),

                  SizedBox(
                    height: screenHeight * 0.070,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0,right: 35.0),
                    child: SubmissionButton(
                      text: 'Agree and Create an Account',
                      onTap: () {


                        if(isChecked1.value && isChecked2.value){
                          // controller.signUpUser();

                          Get.offNamed(Routes.BASE);
                        }
                        else{
                          showSnackBar('Alert', 'Please check all the condition', Colors.red, SnackPosition.BOTTOM);

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
            Obx(() => controller.isLoading.value == true ? const Center(
              child: AppLoder(),
            ) : Container()
            )
          ],
        )
    ));
  }
}