// import 'package:flutter/cupertino.dart';
// import 'dart:io';

// import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/transaction_model.dart';
import '../providers/home_provider.dart';

// import '../../my_card/model/card_model.dart';
// import '../../my_card/providers/my_card_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  TextEditingController searchController=TextEditingController();


  RxBool isTransactionLoading = false.obs;
  var userTransactionList = TransactionModel().obs;


  @override
  void onInit() {
    getUserCurrentBalance();
    getUserTransactionList();
  }


  Future<void> getUserTransactionList() async {

    debugPrint("function calll for card fetch.................");

    isTransactionLoading.value = true;
    try {
      await HomeProvider().fetchTransactionList().then((result) async {

        // debugPrint("length .........."+userCardList.value.data!.length.toString());

        userTransactionList.value = result!;
        isTransactionLoading.value = false;

        // debugPrint("length .........."+userCardList.value.data!.length.toString());
      }).catchError((error) {
        isTransactionLoading.value = false;
        debugPrint("getCustomerIncomeDetails catchError $error");
        // negativeSnackbar(Icons.warning_outlined, "Warning!", "Something wrong");
      });
    } on HttpException {
      debugPrint("getCustomerIncomeDetails catchError http");
      // negativeSnackbar(Icons.warning_outlined, "Warning!", "Something wrong");
    } finally {
      isTransactionLoading.value =  false;
    }

  }

  Future<void> getUserCurrentBalance() async {

    debugPrint("function calll for card fetch.................");

    isTransactionLoading.value = true;
    try {
      await HomeProvider().getUserBalance().then((result) async {


        // debugPrint("length .........."+userCardList.value.data!.length.toString());
      }).catchError((error) {

        debugPrint("getCustomerIncomeDetails catchError $error");
        // negativeSnackbar(Icons.warning_outlined, "Warning!", "Something wrong");
      });
    } on HttpException {
      debugPrint("getCustomerIncomeDetails catchError http");
      // negativeSnackbar(Icons.warning_outlined, "Warning!", "Something wrong");
    } finally {

    }

  }


}
