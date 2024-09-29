import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_pay/app/util/app_color.dart';

import '../../../util/app_constant.dart';
import 'package:http/http.dart' as http;

import '../../../util/app_local_stroge.dart';
import '../../../widgets/app_snackbar.dart';

class CardAddingProvider extends GetConnect {


  Future<dynamic> addUserDebitOrCreditCard(String cardType, String cardHolderName,String cardNumber,String expDate, String cvv) async {
     Map<String,dynamic> userData = {};
    userData['card_type'] = cardType;
    userData['holder_name'] = cardHolderName;
    userData['card_number'] = cardNumber;
    userData['mm_yy'] = expDate;
    userData['cvv'] = cvv;

     Map<String, String> headers = {
       "Authorization": "Bearer ${getStorage.read('token')}",
     };

    final url = Uri.parse('${BASE_URL}save-card');

     debugPrint("first function calll associate.................");

    // debugPrint("ressssssssssssssssssssssssssss add card" + userData.toString());
    //
    // debugPrint("ressssssssssssssssssssssssssss add card" + url.toString());

    var response = await http.post(url, body: userData,headers: headers);

    // debugPrint("ressssssssssssssssssssssssssss add card" + response.statusCode.toString());
    debugPrint("ressssssssssssssssssssssssssss add card" + response.body.toString());

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      try {
        if (jsonResponse['status'] == 200) {
          // debugPrint("ressssssssssssssssssssssssssss11111111111" + jsonResponse.toString());

          showSnackBar('Success', '${jsonResponse['message']}', AppColors.colorBlue, SnackPosition.BOTTOM);

          return true;
        } else {

          showSnackBar("Caution",jsonResponse["message"],Colors.orangeAccent,SnackPosition.BOTTOM);
          return false;
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      return false;
    }
  }
}
