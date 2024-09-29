



import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/card_model.dart';
import '../providers/my_card_provider.dart';

class MyCardController extends GetxController{


  RxBool isCardLoading = false.obs;
  var userCardList = CardModel().obs;

  @override
  void onInit() {
    getUserCardList();
  }


  Future<void> getUserCardList() async {

    debugPrint("function calll for card fetch.................");

    isCardLoading.value = true;
    try {
      await MyCardProvider().fetchUserCardList().then((result) async {


        userCardList.value.data = [];

        debugPrint("length .........."+userCardList.value.data!.length.toString());

        userCardList.value = result!;
        isCardLoading.value = false;

        debugPrint("length .........."+userCardList.value.data!.length.toString());
      }).catchError((error) {
        isCardLoading.value = false;
        debugPrint("getCustomerIncomeDetails catchError $error");
        // negativeSnackbar(Icons.warning_outlined, "Warning!", "Something wrong");
      });
    } on HttpException {
      debugPrint("getCustomerIncomeDetails catchError http");
      // negativeSnackbar(Icons.warning_outlined, "Warning!", "Something wrong");
    } finally {
      isCardLoading.value =  false;
    }

  }

}