import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_pay/app/routes/app_pages.dart';
import 'package:p_pay/app/util/app_constant.dart';
import 'package:p_pay/app/util/app_size.dart';
import 'package:p_pay/app/widgets/loder.dart';
import '../../../util/app_color.dart';
import '../../../util/app_local_stroge.dart';
// import '../../../widgets/social_media_signin_button.dart';
import '../../../widgets/submission_button.dart';
import '../../../widgets/text_input_field.dart';
import '../controllers/login_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    RxBool isPasswordVisible=true.obs;
    // String ab='abcdefghi';
    //
    // if(ab[1]-ab[3]!=1){
    //
    // }





    return SafeArea(
      child: Scaffold(
          body:
          Obx(() =>

              Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: screenHeight * 0.070,
                            ),
                            child: Image.asset(kAppLogo),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.050,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                "Email Address",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenHeight * 0.018,

                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12,
                              right: 12
                          ),
                          child: TextInputField(
                            textEditingController: controller.emailController, labelName: 'Enter your email here ...', controller: controller,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.020,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                "Password",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenHeight * 0.018,

                                ),
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: (){
                                Get.toNamed(Routes.PASSWORD_RESET);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Text(
                                  "Forgot Password",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.colorBlue,
                                    fontSize: screenHeight * 0.016,

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 12,
                                right: 12
                            ),
                            child: SizedBox(
                              height: screenHeight * 0.090,
                              child: Obx(()=>TextFormField(
                                controller: controller.passwordController,

                                obscureText: isPasswordVisible.value,
                                // controller.passwordVisible.value == true
                                //     ? false
                                //     : true : false,
                                cursorColor: AppColors.colorBlack,
                                decoration: InputDecoration(

                                  // isCollapsed: true,
                                  // isDense: true,

                                  suffixIcon: IconButton(onPressed: () {
                                    isPasswordVisible.value=!isPasswordVisible.value;
                                  }, icon: isPasswordVisible.value==true?const Icon(Icons.visibility):const Icon(Icons.visibility_off),),






                                  focusedBorder:
                                  OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        15.0),
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width:
                                        2.0),
                                  ),





                                  enabledBorder:
                                  OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        12.0),
                                    borderSide:
                                    const BorderSide(
                                      color: Colors.grey,
                                      width:
                                      1.0,
                                    ),
                                  ),
                                  errorBorder:
                                  OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        15.0),
                                    borderSide:
                                    const BorderSide(
                                      color: Colors.red,
                                      width:
                                      1.0,
                                    ),
                                  ),
                                  focusedErrorBorder:
                                  OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        12.0),
                                    borderSide:
                                    const BorderSide(
                                      color: Colors.grey,
                                      width:
                                      1.0,
                                    ),
                                  ),
                                  labelStyle:
                                  const TextStyle(
                                    color:
                                    Colors.grey,),
                                  hintText: 'Enter Password',

                                  border: const OutlineInputBorder(
                                      borderSide:
                                      BorderSide(
                                        color: Colors.grey,
                                      )
                                  ),
                                ),
                                //controller: textEditingController,
                              ),
                              ),




                            )




                          // TextInputField(
                          //   textEditingController: controller.passwordController, labelName: "Enter password",
                          //   controller: controller,
                          //
                          //
                          // ),
                        ),



                        SizedBox(
                          height: screenHeight * 0.040,
                        ),



                        Padding(
                          padding: const EdgeInsets.only(
                            left: 2.0,
                          ),
                          child: Row(
                            children: [
                              Checkbox(
                                checkColor: AppColors.colorLightWhite,
                                activeColor: AppColors.colorBlue,
                                value: controller.isSignInChecked.value,
                                onChanged: (bool? value) async {

                                  controller.isSignInChecked.value = value!;

                                  if(controller.isSignInChecked.value == true){
                                    await getStorage.write('loginStatus',true);
                                    debugPrint("status from login ......"+getStorage.read('loginStatus').toString());
                                  }
                                  else {
                                    await getStorage.write('loginStatus',false);
                                    debugPrint("status from login ......"+getStorage.read('loginStatus').toString());
                                  }
                                },
                              ),
                              Text(
                                "Keep me signed in",
                                style: GoogleFonts.poppins(
                                  fontSize: screenHeight * 0.018,
                                ),
                              ),
                            ],
                          ),
                        ),




                        SizedBox(
                          height: screenHeight * 0.020,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                          child: SubmissionButton(
                            text: 'Continue',
                            onTap: () async {

                              if(controller.emailController.text == "" && controller.passwordController.text == ""){

                              }
                              else if(controller.emailController.text == "" || controller.passwordController.text == "") {

                              }
                              else {
                                await controller.signInUser();
                              }


                            },
                            height: screenHeight * 0.070,
                            width: screenWidth,
                            color: AppColors.colorBlue,
                            borderRadius: 10,
                            textStyle: GoogleFonts.manrope(
                                fontSize: screenHeight * 0.020,
                                fontWeight: FontWeight.bold
                            ), borderColor: AppColors.colorBlue,
                          ),
                        ),
                        // SizedBox(
                        //   height: screenHeight * 0.040,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //          SizedBox(
                        //            width: screenWidth * 0.095,
                        //            child: const Divider(
                        //              color: AppColors.colorBlack,
                        //            ),
                        //          ),
                        //     Padding(
                        //       padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                        //       child: Text("or sign up with",style: GoogleFonts.poppins(
                        //         fontWeight: FontWeight.w400,
                        //         fontSize: 14,
                        //       ),),
                        //     ),
                        //     SizedBox(
                        //       width: screenWidth * 0.095,
                        //       child: const Divider(
                        //         color: AppColors.colorBlack,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: screenHeight * 0.020,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 5),
                        //   child: Row(
                        //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       SocialMediaSigninButton(onTap: () {  }, logoImagePath: kGoogleIcon, label: 'Google',),
                        //       SocialMediaSigninButton(onTap: () {  }, logoImagePath: kAppleIcon, label: 'Apple',),
                        //       SocialMediaSigninButton(onTap: () {  }, logoImagePath: kFacebookIcon, label: ' Facebook',)
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: screenHeight * 0.040,
                        ),
                        Row(

                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [

                            GestureDetector(
                              onTap: (){
                                Get.toNamed(
                                    Routes.SIGNIN
                                );
                              },
                              child: RichText(
                                text:  TextSpan(
                                  text: 'Don’t have an Account? ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: screenHeight * 0.018,
                                      color: AppColors.colorBlack),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: " Sign up here",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: screenHeight * 0.018,
                                        color: AppColors.colorBlue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  controller.isLoading.value == true ?  const Center(
                    child:  AppLoder(),
                  ) : Container()
                ],
              )

          )
      ),
    );
  }
}
