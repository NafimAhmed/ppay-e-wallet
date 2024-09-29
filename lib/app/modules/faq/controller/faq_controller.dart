





import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/faq_model.dart';
import '../providers/faq_provider.dart';

class FAQController extends GetxController{

  RxBool isFAQLoading = false.obs;
  var userFaq = FaqModel().obs;
  var userFaqList = FaqModel().obs;
  var userSearchFaqList = FaqModel().obs;
  var searchValue = "".obs;


  @override
  void onInit() {
    getUserFAQ();
    getUserFAQList();
  }



  Future<void> getUserFAQ() async {

    isFAQLoading.value = true;
      try {
        await FaqProvider().fetchUserFaq().then((result) async {

          userFaq.value = result;
          isFAQLoading.value = false;

        }).catchError((error) {
          isFAQLoading.value = false;
          debugPrint("getCustomerIncomeDetails catchError $error");
          // negativeSnackbar(Icons.warning_outlined, "Warning!", "Something wrong");
        });
      } on HttpException {
        debugPrint("getCustomerIncomeDetails catchError http");
        // negativeSnackbar(Icons.warning_outlined, "Warning!", "Something wrong");
      } finally {
        isFAQLoading.value =  false;
      }

  }

  Future<void> getUserFAQList() async {

    isFAQLoading.value = true;
    try {
      await FaqProvider().fetchUserFaqList().then((result) async {

        userFaqList.value = result;
        isFAQLoading.value = false;

      }).catchError((error) {
        isFAQLoading.value = false;
        debugPrint("getCustomerIncomeDetails catchError $error");
        // negativeSnackbar(Icons.warning_outlined, "Warning!", "Something wrong");
      });
    } on HttpException {
      debugPrint("getCustomerIncomeDetails catchError http");
      // negativeSnackbar(Icons.warning_outlined, "Warning!", "Something wrong");
    } finally {
      isFAQLoading.value =  false;
    }

  }

  Future<void> getUserSearchFAQList() async {

    isFAQLoading.value = true;
    try {
      await FaqProvider().fetchSearchFaqList(searchValue.value).then((result) async {

        userSearchFaqList.value = result;
        isFAQLoading.value = false;

      }).catchError((error) {
        isFAQLoading.value = false;
        debugPrint("getCustomerIncomeDetails catchError $error");
        // negativeSnackbar(Icons.warning_outlined, "Warning!", "Something wrong");
      });
    } on HttpException {
      debugPrint("getCustomerIncomeDetails catchError http");
      // negativeSnackbar(Icons.warning_outlined, "Warning!", "Something wrong");
    } finally {
      isFAQLoading.value =  false;
    }

  }

}