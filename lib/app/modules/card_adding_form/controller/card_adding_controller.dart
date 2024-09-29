
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:p_pay/app/modules/card_adding_form/provider/card_adding_provider.dart';


class CardAddingController extends GetxController{

  RxString holderName=''.obs;
  RxString crdNumber=''.obs;
  RxString cvvNumber= ''.obs;
  RxString expDate=''.obs;
  RxBool isCardTurn = false.obs;
  RxBool isAddCardLoading = false.obs;
  
  Future<void> saveUserCreditOrDebitCard() async {
    debugPrint("first function calll.................");
     isAddCardLoading = true.obs;
     await CardAddingProvider().addUserDebitOrCreditCard('VISA', holderName.value, crdNumber.value, expDate.value, cvvNumber.value);
     isAddCardLoading = false.obs;
  }
  
  
  
  
  
  @override
  void onInit() {

  }

  @override
  void onClose() {
    
  }

  @override
  void onReady() {

  }
}