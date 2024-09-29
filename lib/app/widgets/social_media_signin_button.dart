// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/util/app_color.dart';
import 'package:p_pay/app/util/app_size.dart';

class SocialMediaSigninButton extends StatelessWidget {
  const SocialMediaSigninButton({super.key,
    required this.onTap,required this.logoImagePath,
    required this.label});

  final Callback onTap;
  final String logoImagePath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.31,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColors.colorLightWhite, backgroundColor: AppColors.colorLightWhite, side: const BorderSide(color: Colors.grey, width: 1),
            // shadowColor: Colors.greenAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0,

              ),

            ),
             // minimumSize: Size(screenWidth * 0.06, screenHeight * 0.045),
          ),


          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            logoImagePath,
          ),
          //  SizedBox(
          //   width:  screenWidth * 0.010,
          // ),
          Text(
            label,
            style: GoogleFonts.poppins(
                color: AppColors.colorBlack,
                fontSize: 09,
                fontWeight: FontWeight.w500),
          ),
        ],
      )),
    );
  }
}
