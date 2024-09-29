
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/modules/edit_profile/controller/edit_profile_controller.dart';
import 'package:p_pay/app/modules/signin/controllers/signin_controller.dart';

import '../../../util/app_color.dart';
import '../../../util/app_local_stroge.dart';
import '../../../util/app_size.dart';
import '../../../util/country_list.dart';
import '../../../widgets/box_dropdown.dart';
import '../../../widgets/box_text_field.dart';
import '../../../widgets/submission_button.dart';

class EditProfileView extends GetView<EditProfileController>{
  const EditProfileView({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SigninController signinController  = SigninController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Account'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [


            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(

                    margin: const EdgeInsets.symmetric(horizontal: 23),

                    child: const Text('Name'),
                  ),
                  BoxTextField(
                    textEditingController: controller.nameController,
                    labelName: '${getStorage.read('first_name').toString()} ${getStorage.read('last_name').toString()}',

                  ),
                ],
              ),
            ),

            SizedBox(
              height: screenHeight * 0.020,
            ),

            Container(
              margin: const EdgeInsets.only(left: 35.0, right: 35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Nationality'),
                  BoxDropdown(
                    selectedItem: CountryList.nationalityList[0],
                    menuItem: CountryList.nationalityList,//const ['Malean', 'Bangladeshi', 'British', 'Scotish'],
                    hintText: 'Nationality', borderRadious: 10,signinController: signinController,),
                ],
              ),
            ),


            SizedBox(
              height: screenHeight * 0.020,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(margin: const EdgeInsets.symmetric(horizontal: 23),child: const Text('Address'),),
                  BoxTextField(
                    textEditingController: controller.addressController,
                    labelName: '${getStorage.read('address1').toString()} ${getStorage.read('address2').toString()}',
                    // controller: controller,
                  ),
                ],
              ),
            ),


            SizedBox(
              height: screenHeight * 0.020,
            ),




            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(margin: const EdgeInsets.symmetric(horizontal: 23),child: const Text('Phone'),),
                  BoxTextField(
                    textEditingController: controller.phoneController,
                    labelName: getStorage.read('phone').toString(),
                    // controller: controller,
                  ),
                ],
              ),
            ),


            SizedBox(
              height: screenHeight * 0.020,
            ),


            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(margin: const EdgeInsets.symmetric(horizontal: 23),child: const Text('Email'),),
                  BoxTextField(
                    textEditingController: controller.emailController,
                    labelName: getStorage.read('email').toString(),
                    // controller: controller,
                  ),
                ],
              ),
            ),




            SizedBox(
              height: screenHeight * 0.070,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35.0, right: 35.0),
              child: SubmissionButton(
                text: 'Save',
                onTap: () {

                  Get.back();
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
    );
  }

}