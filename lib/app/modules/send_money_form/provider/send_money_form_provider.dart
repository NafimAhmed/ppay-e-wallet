import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_pay/app/routes/app_pages.dart';
// import 'package:p_pay/app/modules/signin/controllers/signin_controller.dart';

import '../../../util/app_constant.dart';
import 'package:http/http.dart' as http;

import '../../../util/app_local_stroge.dart';
import '../../../widgets/app_snackbar.dart';
import '../controller/send_money_form_controller.dart';

class SendMoneyFormProvider extends GetConnect {

  Map<String, String> headers = {
    "Authorization": "Bearer ${getStorage.read('token')}",
  };




  Future<dynamic> searchUserID() async {
    var userData = {};
    //userData['email'] = SendMoneyFormController.receiverEmailController.text;
    // userData['password'] = password;


    final url = Uri.parse(BASE_URL + 'search-user/${SendMoneyFormController.receiverEmailController.text}/null');

    debugPrint("ressssssssssssssssssssssssssss" + userData.toString());

    // final url = Uri.parse('http://172.31.120.58:80/api/user-login');

    debugPrint("ressssssssssssssssssssssssssss" + url.toString());

    var response = await http.get(url,headers: headers);

    debugPrint("ressssssssssssssssssssssssssss" + response.statusCode.toString());
    debugPrint("ressssssssssssssssssssssssssss" + response.body.toString());

    if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);

    try {
    if (jsonResponse['status'] == 200) {
    debugPrint("ressssssssssssssssssssssssssss11111111111" + jsonResponse.toString());


    Get.toNamed(Routes.CONFIRMATION, arguments: {
    'email': SendMoneyFormController.receiverEmailController.text,
    'amount': SendMoneyFormController.amountEditingController.text,
    'currency':SendMoneyFormController.selectedCurrency.value,
      'receiver_id':jsonResponse["data"][0]["id"]
    });

    return true;
    } else {

    showSnackBar("Caution",jsonResponse["message"],Colors.orangeAccent,SnackPosition.BOTTOM);
    debugPrint("status from login ......"+getStorage.read('loginStatus').toString());
    return false;
    }
    } catch (e) {
    debugPrint(e.toString());
    }
    } else {
    var jsonResponse = json.decode(response.body);
    showSnackBar("Caution",jsonResponse["message"],Colors.orangeAccent,SnackPosition.BOTTOM);
    debugPrint("status from login ......"+getStorage.read('loginStatus').toString());
    return false;
    }
    }




    }





