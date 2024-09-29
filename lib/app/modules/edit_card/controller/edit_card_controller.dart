




import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../provider/edit_card_provider.dart';

class EditCardControllers extends GetxController{
  var args;

  RxBool isAddCardLoading = false.obs;

  Future<void> deleteUserCreditOrDebitCard() async {
    isAddCardLoading = true.obs;
    await EditCardProvider().deleteUserDebitOrCreditCard('${args['card_id']}');
    isAddCardLoading = false.obs;
  }




  @override
  void onInit() {

     args = Get.arguments;

  }

  @override
  void onClose() {

  }

  @override
  void onReady() {

  }
}