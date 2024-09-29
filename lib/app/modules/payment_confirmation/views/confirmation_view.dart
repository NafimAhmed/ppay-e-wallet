import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:p_pay/app/modules/confirmation/controller/confirmation_controller.dart';
import 'package:p_pay/app/util/app_color.dart';
import 'package:p_pay/app/util/app_size.dart';
import 'package:p_pay/app/widgets/confirmation_card_template.dart';
import 'package:p_pay/app/widgets/submission_button.dart';
import 'package:p_pay/app/widgets/success_view.dart';

import '../controller/confirmation_controller.dart';

class PaymentConfirmationView extends GetView<PaymentConfirmationController> {
  const PaymentConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                   ConfirmationCardTemplate(cardName: '', cardNumber: '', expDate: '',),


                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'To',
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF6B7280),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Linda32@gmail.com',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF1D3A6F),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top up balance',
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF6B7280),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '\$2,256.00',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF1D3A6F),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fee',
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF6B7280),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '\$3.0',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF1D3A6F),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 0.09,
                          letterSpacing: 0.30,
                        ),
                      ),
                      Text(
                        '\$2,259.00',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF1D3A6F),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          height: 0.09,
                          letterSpacing: 0.30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.3,
            ),
            SubmissionButton(
                text: 'Payments',
                onTap: () {
                  Get.to(() =>  const SuccessView( amount: '1872',));
                },
                height: 50,
                width: screenWidth * 0.8,
                color: AppColors.colorLightBlue,
                borderRadius: 10,
                borderColor: AppColors.colorLightBlue)
          ],
        ),
      ),
    );
  }
}
