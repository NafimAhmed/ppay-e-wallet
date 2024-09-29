



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/modules/refer_code/controller/refer_code_controller.dart';
import 'package:p_pay/app/util/app_size.dart';
import 'package:p_pay/app/widgets/app_snackbar.dart';

import '../../../util/app_color.dart';
// import 'package:share_plus/share_plus.dart';

class ReferCodeViews extends GetView<ReferCodeController>{
  const ReferCodeViews({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            SvgPicture.asset('assets/icons/undraw_happy_feeling_slmw.svg',height: screenWidth*0.5,width: screenWidth*0.5,),

            const SizedBox(height: 30,),

            SizedBox(
              width: 260,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Here’s \$20 ',
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF1D3A6F),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,

                      ),
                    ),
                    TextSpan(
                      text: 'free',
                      style: GoogleFonts.roboto(
                        color: AppColors.colorBlack,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: ' on us!',
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF1D3A6F),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),


            SizedBox(
              width: 260,
              child: Text(
                'Share you referral link and earn \$20',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: const Color(0xFF6B7280),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),


            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  InkWell(
                    onTap: () async {
                      await Clipboard.setData(const ClipboardData(text: "LIK5896O"));


                      showSnackBar('Copy', 'Text is copied to the clipboard', Colors.green, SnackPosition.BOTTOM);
                      // Get.snackbar('Copy', 'Text is copied to the clipboard', colorText: Colors.white,
                      //   backgroundColor: AppColors.colorLightBlue,
                      //   snackPosition: SnackPosition.BOTTOM,
                      //   margin: const EdgeInsets.symmetric(vertical: 25,horizontal: 10),
                      //
                      // );
            },
                      child: const Icon(Icons.copy)
                  ),

                  Text(
                    'LIK5896O',
                    style: GoogleFonts.roboto(
                      color: const Color(0xFF9CA3AF),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),


                  InkWell(
                    onTap: () async {
                      // await Share.share(
                      //     'LIK5896O',
                      //     subject: "Refer Code");
                    },
                    child: Text(
                      'Share',
                      style: GoogleFonts.roboto(
                        color: AppColors.colorBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )



                ],
              ),
            ),



            const SizedBox(
              width: 241,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Get \$3 ',
                      style: TextStyle(
                        color: Color(0xFF1D3A6F),
                        fontSize: 24,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0.05,
                        letterSpacing: -0.20,
                      ),
                    ),
                    TextSpan(
                      text: 'free',
                      style: TextStyle(
                        color: AppColors.colorBlack,
                        fontSize: 24,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0.05,
                        letterSpacing: -0.20,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),


            const SizedBox(height: 20,),


            const SizedBox(
              width: 241,
              child: Text(
                'For any account you connects',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 0.09,
                  letterSpacing: 0.30,
                ),
              ),
            ),



            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(screenWidth*0.4, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),

                        ),
                    ),
                      onPressed: () {  },
                      child: SvgPicture.asset('assets/icons/google.svg',width: 30,height: 30,),

                  ),
                  ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(screenWidth*0.4, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),

                        ),
                    ),
                      onPressed: () {

                      },
                      child: SvgPicture.asset('assets/icons/apple_icon.svg',width: 30,height: 30,),

                  ),
                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}