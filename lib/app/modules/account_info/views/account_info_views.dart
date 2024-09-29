import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/modules/account_info/controller/account_info_controller.dart';
import 'package:p_pay/app/util/app_color.dart';
import 'package:p_pay/app/util/app_size.dart';
import 'package:p_pay/app/widgets/submission_button.dart';

import '../../../routes/app_pages.dart';
import '../../../util/app_constant.dart';
import '../../../util/app_local_stroge.dart';

class AccountInfoViews extends GetView<AccountInfoController> {
  const AccountInfoViews({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    RxBool usCitizen = false.obs;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Info'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.network(
                  //imageLink,
                  '$IMAGE_BASE_URL${getStorage.read('profile_picture').toString()}',
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover),
            ),
            SizedBox(
              width: 327,
              height: screenHeight * .4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Personal Info',
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      height: 0.09,
                      letterSpacing: 0.30,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: screenHeight * .30,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1,


                            //color: Colors.red
                             color: Color(0xFFF3F4F6)

                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Your name',
                                style: TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  height: 0.11,
                                  letterSpacing: 0.30,
                                ),
                              ),
                              const Spacer(),


                              Container(
                                width: screenWidth/ 2,
                                child: Text(

                                  '${getStorage.read("first_name")} ${getStorage.read('last_name')}',
                                  //'Manager',
                                  //textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,

                                  style: TextStyle(
                                    color: Color(0xFF1D3A6F),
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                ),
                              ),




                              // Text(
                              //   "${getStorage.read("first_name")} ${getStorage.read('last_name')}",
                              //   textAlign: TextAlign.right,
                              //   style: const TextStyle(
                              //     color: Color(0xFF1D3A6F),
                              //     fontSize: 14,
                              //     fontFamily: 'Roboto',
                              //     fontWeight: FontWeight.w600,
                              //     height: 0.11,
                              //     letterSpacing: 0.30,
                              //   ),
                              // ),
                            ],
                          ),
                        ),



                         SizedBox(
                          width: screenWidth,
                          height: 48,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Address',
                                style: TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  height: 0.11,
                                  letterSpacing: 0.30,
                                ),
                              ),
                              SizedBox(width: 58),



                              Container(
                                width: screenWidth/ 2,
                                child: Text(

                                  '${getStorage.read('address1').toString()} ${getStorage.read('address2').toString()}',
                                  //'Manager',
                                  //textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,

                                  style: TextStyle(
                                    color: Color(0xFF1D3A6F),
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),





                        const SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Currency',
                                style: TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  height: 0.11,
                                  letterSpacing: 0.30,
                                ),
                              ),
                              Text(
                                'USD',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF1D3A6F),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  height: 0.11,
                                  letterSpacing: 0.30,
                                ),
                              ),
                            ],
                          ),
                        ),


                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('U.S Citizen',

                                style: GoogleFonts.roboto(
                                  color: const Color(0xFF6B7280),
                                  fontSize: 14,

                                  fontWeight: FontWeight.w600,

                                ),

                              ),

                              Switch.adaptive(
                                activeColor: AppColors.colorLightBlue,
                                value: usCitizen.value,
                                onChanged: (bool value) {


                                  usCitizen.value = value;


                                  // setState(() {
                                  //   light = value;
                                  // });
                                },
                              ),

                            ],
                          ),

                          //     SwitchListTile(
                          //   title: const Text('U.S Citizen'),
                          //   value: usCitizen.value,
                          //   onChanged: (bool value) {
                          //     usCitizen.value = value;
                          //   },
                          //   //secondary: const Icon(Icons.lightbulb_outline),
                          // ),
                          //



                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),





            SizedBox(
              width: 327,
              // height: 164,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact Info',
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      height: 0.09,
                      letterSpacing: 0.30,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: screenHeight * 0.16,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Color(0xFFF3F4F6)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child:  Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Phone number',
                                style: TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  height: 0.11,
                                  letterSpacing: 0.30,
                                ),
                              ),
                              // const SizedBox(width: 130),
                              Text(
                                getStorage.read('phone').toString(),//'(1) 3256 8456 888',
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  color: Color(0xFF1D3A6F),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  height: 0.11,
                                  letterSpacing: 0.30,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Email',
                                style: TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  height: 0.11,
                                  letterSpacing: 0.30,
                                ),
                              ),
                              //const SizedBox(width: 130),
                              Text(
                                getStorage.read("email").toString(),//'shantoshah232@mail.com',
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  color: Color(0xFF1D3A6F),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  height: 0.11,
                                  letterSpacing: 0.30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SubmissionButton(
              text: 'Edit',
              onTap: () {
                Get.toNamed(Routes.EDIT_PROFILE);
              },
              height: 50,
              width: screenWidth * 0.8,
              color: AppColors.colorLightWhite,
              borderRadius: 10,
              borderColor: AppColors.colorLightWhite,
              textStyle: GoogleFonts.roboto(
                color: AppColors.colorDeepBlue,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}
