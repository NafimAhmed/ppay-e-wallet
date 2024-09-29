import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/modules/signin/controllers/signin_controller.dart';
import 'package:p_pay/app/modules/signin/views/address_settings.dart';
import 'package:p_pay/app/util/country_list.dart';
import 'package:p_pay/app/widgets/box_dropdown.dart';

import '../../../util/app_color.dart';
import '../../../util/app_size.dart';
import '../../../widgets/arrow_back_button.dart';
import '../../../widgets/box_text_field.dart';
import '../../../widgets/indicator_line.dart';
import '../../../widgets/submission_button.dart';
// import '../../profile_setting/views/profile_setting_view.dart';

class PersonalInfo extends GetView<SigninController> {
  const PersonalInfo({super.key});



  @override
  Widget build(BuildContext context) {


    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.020, left: screenWidth * 0.040),
                  child: const ArrowBackButton(),
                ),
                SizedBox(
                  height: screenHeight * 0.020,
                ),
                const IndicatorLine(
                  percent: 0.5714,
                ),
                SizedBox(
                  height: screenHeight * 0.020,
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.040),
                  child: Text(
                    'Set Up Your Profile',
                    style: GoogleFonts.poppins(
                        color: AppColors.colorBlack,
                        fontWeight: FontWeight.w700,
                        fontSize: screenHeight * 0.027),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.010,
                ),
                SizedBox(
                  height: screenHeight * 0.010,
                ),

                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.040),
                  child: Text(
                    'This information needs to be accurate.',
                    style: GoogleFonts.poppins(
                        color: AppColors.colorBlack,
                        fontSize: screenHeight * 0.017),
                  ),
                ),

                SizedBox(
                  height: screenHeight * 0.020,
                ),

                Container(
                  margin: const EdgeInsets.only(left: 35.0, right: 35.0),
                  child: BoxDropdown(
                    menuItem: CountryList.nationalityList,//const ['Malean', 'Bangladeshi', 'British', 'Scotish'],
                    hintText: 'Nationality', borderRadious: 10,signinController: controller,),
                ),

                SizedBox(
                  height: screenHeight * 0.020,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: BoxTextField(
                    textEditingController: controller.firstNameController,
                    labelName: 'First Name',
                    controller: controller,
                  ),
                ),



                SizedBox(
                  height: screenHeight * 0.020,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: BoxTextField(
                    textEditingController: controller.lastNameController,
                    labelName: 'Last Name',
                    controller: controller,
                  ),
                ),

                SizedBox(
                  height: screenHeight * 0.020,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                  child: BoxDropdown(

                    menuItem: const ['NID', 'Passport', 'Birth certificate'],
                    hintText: 'Document Type', borderRadious: 10,signinController: controller,),
                ),

                SizedBox(
                  height: screenHeight * 0.020,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: BoxTextField(
                    textEditingController: controller.docController,
                    labelName: 'Document Number',
                    controller: controller,
                  ),
                ),

                SizedBox(
                  height: screenHeight * 0.020,
                ),





                // Padding(
                //   padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Container(
                //         color: AppColors.colorGrey,
                //         height: screenHeight * 0.070,
                //         child: Padding(
                //           padding: EdgeInsets.only(
                //             left: screenWidth * 0.00,
                //           ),
                //           child: InkWell(
                //             onTap: () {
                //
                //             },
                //             child:
                //           ),
                //         ),
                //       ),
                //       Expanded(
                //         child: BoxTextField(
                //           textEditingController: controller.emailController,
                //           labelName: 'Date of Birth',
                //           controller: controller,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),





                ///////////////////////////////////////////////////////////////////////


                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.colorGreyLight,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.datetime,
                    controller: controller.dateController,
                    //obscureText: false,
                    cursorColor: AppColors.colorBlack,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1965, 1, 1),
                          lastDate: DateTime(2025, 1, 1),
                        ).then((value){
                          if(value!=null) {
                            controller.dateController.text='${value.day}/${value.month}/${value.year}';
                          }
                        });
                      }, icon: const Icon(
                        Icons.calendar_month_outlined,
                        color: AppColors.colorLightGrey,
                      ),

                      ),
                      hintStyle: GoogleFonts.poppins(
                        color: AppColors.colorBlack.withOpacity(0.5),
                      ),
                      hintText: 'Date of Birth',
                      border: InputBorder.none,
                    ),
                    onChanged: (String? value) {
                      //textEditingController.text = value!;
                    },

                    // controller: textEditingController,
                  ),
                ),



//////////////////////////////////////////////////////////////////////////////////////////////
                // SizedBox(
                //   height: screenHeight * 0.020,
                // ),

                SizedBox(
                  height: screenHeight * 0.070,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                  child: SubmissionButton(
                    text: 'Next',
                    onTap: () {
                      Get.to(() => AddressSetting());
                    },
                    height: screenHeight * 0.075,
                    width: screenWidth,
                    color: AppColors.colorLightBlue,
                    borderRadius: 5.0,
                    textStyle: GoogleFonts.manrope(
                        fontSize: screenHeight * 0.020,
                        fontWeight: FontWeight.bold),
                    borderColor: AppColors.colorBlue,
                  ),
                ),

                SizedBox(
                  height: screenHeight * 0.070,
                ),



              ],
            ),
          ),
        ));
  }
}
