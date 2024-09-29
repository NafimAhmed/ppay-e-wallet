// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/modules/password_reset/controller/password_reset_controller.dart';
import 'package:p_pay/app/util/app_size.dart';
import 'package:p_pay/app/widgets/submission_button.dart';

import '../../../util/app_color.dart';
import '../../../widgets/loder.dart';

class PasswordResetViews extends GetView<PasswordResetController> {
   PasswordResetViews({super.key});

  PasswordResetController homeController = Get.put(PasswordResetController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    RxBool confirmPassHide = true.obs;
    RxBool newPassHide = true.obs;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Reset'),
        centerTitle: true,
      ),
      body:
      Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Create New Password',
                    style: GoogleFonts.roboto(
                      color: const Color(0xFF1D3A6F),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      height: 0.05,
                      letterSpacing: -0.20,
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  width: screenWidth,
                  child: Text(
                    'Please, enter a new password below different from the previous password',
                    style: GoogleFonts.roboto(
                      color: const Color(0xFF6B7280),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.colorGreyLight,
                    ),
                    child: Obx(()=> TextFormField(
                      //controller: controller.newPasswordController,
                      obscureText: newPassHide.value,
                      cursorColor: AppColors.colorBlack,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              newPassHide.value=!newPassHide.value;
                            },
                            icon: newPassHide.value==true?

                            const Icon(
                              Icons.visibility,
                              color: AppColors.colorBlack,
                            ):
                            const Icon(
                              Icons.visibility_off,
                              color: AppColors.colorBlack,
                            )
                        ),
                        hintStyle: GoogleFonts.poppins(
                          color: AppColors.colorBlack.withOpacity(0.5),
                        ),
                        hintText: 'Enter new password',
                        border: InputBorder.none,
                      ),
                      onChanged: (String? value) {
                        //textEditingController.text = value!;
                        homeController.newPasswordController.value = value!;
                      },

                      // controller: textEditingController,
                    ),)

                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.colorGreyLight,
                  ),
                  child: Obx(()=> TextFormField(
                    //controller: controller.confirmPasswordController,
                    obscureText: confirmPassHide.value,
                    cursorColor: AppColors.colorBlack,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            confirmPassHide.value=!confirmPassHide.value;
                          },
                          icon: confirmPassHide.value == true?

                          const Icon(
                            Icons.visibility,
                            color: AppColors.colorBlack,
                          ):
                          const Icon(
                            Icons.visibility_off,
                            color: AppColors.colorBlack,
                          )
                      ),
                      hintStyle: GoogleFonts.poppins(
                        color: AppColors.colorBlack.withOpacity(0.5),
                      ),
                      hintText: 'Confirm new password',
                      border: InputBorder.none,
                    ),
                    onChanged: (String? value) {
                      homeController.confirmPasswordController.value=value!;
                      //textEditingController.text = value!;
                    },

                    // controller: textEditingController,
                  ),),

                ),

                SizedBox(height: screenHeight*0.35,),
                SubmissionButton(
                  text: 'Create new password',
                  onTap: () {
                    homeController.resetUserPassword();
                  },
                  height: 50,
                  width: screenWidth * 0.8,
                  color: AppColors.colorLightBlue,
                  borderRadius: 10,
                  borderColor: AppColors.colorLightBlue,
                )
              ],
            ),
          ),
          Obx(() =>  homeController.isPasswordLoading.value == true ?
          const Center(
            child: AppLoder(),
          ) : Container())
        ],
      )
    );
  }
}
