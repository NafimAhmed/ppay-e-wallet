import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/modules/send_money_form/controller/send_money_form_controller.dart';
import 'package:p_pay/app/modules/signin/controllers/signin_controller.dart';
import 'package:p_pay/app/util/app_color.dart';
import 'package:p_pay/app/util/app_constant.dart';
import 'package:p_pay/app/util/app_size.dart';
import 'package:p_pay/app/util/country_list.dart';
import 'package:p_pay/app/widgets/app_snackbar.dart';
import 'package:p_pay/app/widgets/box_text_field.dart';
import 'package:p_pay/app/widgets/submission_button.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/arrow_back_button.dart';
import '../provider/send_money_form_provider.dart';

class SendMoneyFormView extends GetView<SendMoneyFormController> {

  SendMoneyFormView({super.key, required this.emPhoneNumber});

   final String emPhoneNumber;

   final SigninController receiverSigningController = SigninController();


  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBackButton(),
        title: const Text('Send money'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BoxTextField(
              textEditingController: SendMoneyFormController.receiverEmailController,
              labelName: 'Email or Phone number',
              controller: receiverSigningController),



          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Account Balance',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                  ),
                ),
                Text('\$ '+currentBalance.toString(),style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  color: AppColors.colorDeepBlue
                ),),
              ],
            )
          ),

          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Enter amount:',
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF6B7280),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      ' fee \$3.0',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF6B7280),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),

                Row(
                  children: [


                    Container(

                      padding: EdgeInsets.symmetric(horizontal: 7),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color:Colors.grey.shade300,
                      ),
                      child: Text(
                        'USD',

                        style: const TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,

                        ),

                        textAlign: TextAlign.start

                      ),
                    ),

                    Container(
                      height: 40,
                      width: 200,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: SendMoneyFormController.amountEditingController,
                        keyboardType: TextInputType.number,
                        //expands: true,
                        //controller: amountEditingController,
                        decoration: const InputDecoration(
                          isCollapsed: true,
                          border: InputBorder.none,
                          hintText: 'Enter Amount',
                          errorBorder: OutlineInputBorder(
                            //<-- SEE HERE
                            borderSide: BorderSide(
                                width: 1, color: AppColors.colorBlack),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SubmissionButton(
              text: 'Send Money',
              onTap: () {
                if (SendMoneyFormController.receiverEmailController.text.isEmpty) {
                  showSnackBar('Warning', 'please enter valid email address',
                      Colors.red, SnackPosition.BOTTOM);
                } else if (SendMoneyFormController.amountEditingController.text.isEmpty) {
                  showSnackBar('Warning', 'please enter valid amount',
                      Colors.red, SnackPosition.BOTTOM);
                } else {
                  //Get.toNamed(Routes.CONFIRMATION);

                 SendMoneyFormProvider().searchUserID();

                }
              },
              height: 50,
              width: screenWidth * 0.8,
              color: AppColors.colorLightBlue,
              borderRadius: 10,
              borderColor: AppColors.colorLightBlue)
        ],
      ),
    );
  }
}
