import 'dart:convert';
import 'dart:io';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:p_pay/app/modules/send_money_form/controller/send_money_form_controller.dart';

import '../../../util/app_constant.dart';
import '../../../util/app_local_stroge.dart';

import 'package:http/http.dart' as http;

class BaseProvider extends GetConnect {

  Future<String> fetchUserQRData(String qrData) async {

    Map<String, String> headers = {
      "Authorization": "Bearer ${getStorage.read('token')}",
    };

    final url = Uri.parse('${BASE_URL}$qrData');
    var response = await http.get(
      url,
      headers: headers,
    );

    debugPrint("status code....."+response.statusCode.toString());


    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if(jsonResponse["success"] == true ){
        debugPrint(response.body);
        return jsonResponse["data"]["email"].toString();
      }
      else {
        return "no email found";
      }
    } else if (response.statusCode == 400) {
      throw const HttpException('getCustomerAddressData Error');
    } else {
      throw const HttpException('getCustomerAddressData Error');
    }
  }


}
