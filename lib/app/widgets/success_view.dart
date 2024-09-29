



// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/util/app_color.dart';
import 'package:p_pay/app/util/app_size.dart';
import 'package:p_pay/app/widgets/submission_button.dart';

import '../routes/app_pages.dart';

class SuccessView extends StatelessWidget{
  final String amount;
  const SuccessView({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
                'assets/images/undraw_transfer_money_rywa.svg'
            ),

            Text(
              'Transfer Successful',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: const Color(0xFF1D3A6F),
                fontSize: 24,
                //fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              ),
            ),


            Text(
              'Transfers are reviewed which may result in delays or funds being frozen',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: const Color(0xFF6B7280),
                fontSize: 11,
                fontWeight: FontWeight.w400,

              ),
            ),


            Text(
              ' $amount',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: const Color(0xFF1D3A6F),
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),


            const SizedBox(height: 50,),
            
            
            SubmissionButton(text: 'Back to Home', onTap: (){
              Get.offNamed(Routes.BASE);
            }, height: 50, width: screenWidth*0.8, color: AppColors.colorLightBlue, borderRadius: 10, borderColor: AppColors.colorLightBlue)





          ],
        ),
      ),
    );
  }
  
}