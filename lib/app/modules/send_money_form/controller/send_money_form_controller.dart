



import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:intl_phone_field/countries.dart';

import '../../../util/country_list.dart';
import '../provider/send_money_form_provider.dart';

class SendMoneyFormController extends GetxController{


  //SendMoneyFormProvider sendMoneyFormProvider=Get.put(SendMoneyFormProvider());

  static TextEditingController amountEditingController = TextEditingController();

  static TextEditingController receiverEmailController = TextEditingController();


 static RxString selectedCurrency = CountryList.currencyList.first.obs;

  static List<Widget> currencyList=[];

  Rx<Widget> currencyDropdownValue = currencyList.first.obs;


  // <Widget>[
  //   //NetworkImage("https://cdn.freebiesupply.com/images/thumbs/2x/visa-card-template-u75.jpg"),
  //   Text(
  //     'USD',
  //     style: TextStyle(
  //       color: Color(0xFF6B7280),
  //       fontSize: 18,
  //       fontWeight: FontWeight.w700,
  //     ),
  //   ),
  //   Text(
  //     "BDT",
  //     style: TextStyle(
  //       color: Color(0xFF1D3A6F),
  //       fontSize: 18,
  //       fontWeight: FontWeight.w700,
  //     ),
  //   ),
  //   //NetworkImage("https://cdn.freebiesupply.com/images/thumbs/2x/visa-card-template-u75.jpg"),
  //   Text(
  //     'Ruble',
  //     style: TextStyle(
  //       color: Color(0xFF6B7280),
  //       fontSize: 18,
  //       fontWeight: FontWeight.w700,
  //     ),
  //   ),
  //
  // ];


  void currecncyDeco(){



    for(int i=0;i<CountryList.currencyList.length;i++) {
      currencyList.add(
        Text(
          CountryList.currencyList[i],
          style: const TextStyle(
            color: Color(0xFF6B7280),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      );



    }
  }









  @override
  void onInit() {
    currecncyDeco();

  }

  @override
  void onClose() {

  }

  @override
  void onReady() {

  }
}