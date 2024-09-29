import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/modules/send_money_confirmation/provider/send_money_confirmation_provider.dart';
// import 'package:intl_phone_field/countries.dart';

//import 'package:p_pay/app/modules/confirmation/controller/confirmation_controller.dart';
import 'package:p_pay/app/util/app_color.dart';
import 'package:p_pay/app/util/app_size.dart';
// import 'package:p_pay/app/widgets/confirmation_card_template.dart';
import 'package:p_pay/app/widgets/submission_button.dart';
// import 'package:p_pay/app/widgets/success_view.dart';

import '../../../util/app_local_stroge.dart';
import '../../../util/country_list.dart';
import '../../../widgets/success_view.dart';
import '../controller/confirmation_controller.dart';

class SendMoneyConfirmationView
    extends GetView<SendMoneyConfirmationController> {
  const SendMoneyConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {

    final args = Get.arguments;

    

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   //ConfirmationCardTemplate(cardName: 'Nafim Ahmed', cardNumber: '12633278683268236832683', expDate: '12/28',),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'To',
                        style: GoogleFonts.roboto(
                          color: AppColors.colorLightGrey,//Color(0xFF6B7280),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        //'Linda32@gmail.com',
                        '${args['email']}',
                        //'${args['receiver_id']}',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF1D3A6F),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top up balance',
                        style: GoogleFonts.roboto(
                          color: AppColors.colorLightGrey,//Color(0xFF6B7280),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${CountryList.currencyMap['${args['currency']}']} ${args['amount']}',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.roboto(
                          color: AppColors.colorDeepBlue,//Color(0xFF1D3A6F),
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
                          color: AppColors.colorLightGrey,//Color(0xFF6B7280),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${CountryList.currencyMap['${args['currency']}']} 3.0',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.roboto(
                          color: AppColors.colorDeepBlue,//Color(0xFF1D3A6F),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          color: AppColors.colorLightGrey,//Color(0xFF6B7280),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 0.09,
                          letterSpacing: 0.30,
                        ),
                      ),
                      Text(
                        '${CountryList.currencyMap['${args['currency']}']} ${ double.parse('${args['amount']}')+3}',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: AppColors.colorDeepBlue,//Color(0xFF1D3A6F),
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

                  controller.sendMoneyToUser(

                       getStorage.read('user_id').toString(), args['receiver_id'].toString(), "debited", args['amount'].toString()
                  );



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
