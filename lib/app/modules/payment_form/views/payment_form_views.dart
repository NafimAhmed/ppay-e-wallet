import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/routes/app_pages.dart';
// import 'package:p_pay/app/modules/send_money_form/controller/send_money_form_controller.dart';
import 'package:p_pay/app/util/app_color.dart';
import 'package:p_pay/app/util/app_size.dart';
import 'package:p_pay/app/widgets/submission_button.dart';

import '../../../widgets/arrow_back_button.dart';
import '../controller/payment_form_controller.dart';

class PaymentFormView extends GetView<PaymentFormController> {
  const PaymentFormView({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> list = <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.credit_card),
          //NetworkImage("https://cdn.freebiesupply.com/images/thumbs/2x/visa-card-template-u75.jpg"),
          Text(
            'card name',
            style: TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "\$ 2142343254",
            style: TextStyle(
              color: Color(0xFF1D3A6F),
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.credit_card),
          //NetworkImage("https://cdn.freebiesupply.com/images/thumbs/2x/visa-card-template-u75.jpg"),
          Text(
            'card name',
            style: TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "\$ 2142343254",
            style: TextStyle(
              color: Color(0xFF1D3A6F),
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.credit_card),
          //NetworkImage("https://cdn.freebiesupply.com/images/thumbs/2x/visa-card-template-u75.jpg"),
          Text(
            'card name',
            style: TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "\$ 2142343254",
            style: TextStyle(
              color: Color(0xFF1D3A6F),
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.credit_card),
          //NetworkImage("https://cdn.freebiesupply.com/images/thumbs/2x/visa-card-template-u75.jpg"),
          Text(
            'card name',
            style: TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "\$ 2142343254",
            style: TextStyle(
              color: Color(0xFF1D3A6F),
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    ];
    const List<Widget> currencyList = <Widget>[
      //NetworkImage("https://cdn.freebiesupply.com/images/thumbs/2x/visa-card-template-u75.jpg"),
      Text(
        'USD',
        style: TextStyle(
          color: Color(0xFF6B7280),
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      Text(
        "BDT",
        style: TextStyle(
          color: Color(0xFF1D3A6F),
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),


      //NetworkImage("https://cdn.freebiesupply.com/images/thumbs/2x/visa-card-template-u75.jpg"),
      Text(
        'Ruble',
        style: TextStyle(
          color: Color(0xFF6B7280),
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),

    ];

    Rx<Widget> dropdownValue = list.first.obs;
    Rx<Widget> currencyDropdownValue = currencyList.first.obs;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBackButton(),
        title: const Text('Payments'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Obx(() => DropdownButton<Widget>(
                  isExpanded: true,
                  value: dropdownValue.value,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.transparent,
                  ),
                  onChanged: (Widget? value) {
                    // This is called when the user selects an item.

                    dropdownValue.value = value!;
                  },
                  items: list.map<DropdownMenuItem<Widget>>((Widget value) {
                    return DropdownMenuItem<Widget>(
                      value: value,
                      child: value,
                    );
                  }).toList(),
                )),
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

                Container(

                  child: Row(
                    children: [

                      SizedBox(
                        height: 50,
                       // width: 200,

                        child: Obx(() => DropdownButton<Widget>(
                          isExpanded: false,
                          value: currencyDropdownValue.value,
                          icon: const Icon(Icons.arrow_drop_down),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.transparent,
                          ),
                          onChanged: (Widget? value) {
                            // This is called when the user selects an item.

                            currencyDropdownValue.value = value!;
                          },
                          items: currencyList.map<DropdownMenuItem<Widget>>((Widget value) {
                            return DropdownMenuItem<Widget>(
                              value: value,
                              child: value,
                            );
                          }).toList(),
                        )),
                      ),


                      const SizedBox(
                        height: 40,
                        width: 200,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          //expands: true,
                         // controller: textEditingController,
                          decoration: InputDecoration(

                            border: InputBorder.none,
                            hintText: 'Enter Amount',
                            errorBorder: OutlineInputBorder(
                              //<-- SEE HERE
                              borderSide: BorderSide(width: 1, color: AppColors.colorBlack),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                )
              ],
            ),
          ),


          SubmissionButton(text: 'Payment', onTap: (){
            Get.toNamed(Routes.PAYMENT_CONFIRMATION);
          }, height: 50, width: screenWidth*0.8, color: AppColors.colorLightBlue, borderRadius: 10, borderColor: AppColors.colorLightBlue)

        ],
      ),
    );
  }
}
