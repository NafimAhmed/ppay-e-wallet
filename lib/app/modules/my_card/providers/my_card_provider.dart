// import 'dart:developer';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../util/app_constant.dart';
import '../../../util/app_local_stroge.dart';
import '../model/card_model.dart';
import 'package:http/http.dart' as http;

class MyCardProvider extends GetConnect {

  Future<CardModel?> fetchUserCardList() async {
    Map<String, String> headers = {
      "Authorization": "Bearer ${getStorage.read('token')}",
    };

    final url = Uri.parse('${BASE_URL}card');
    var response = await http.get(
      url,
      headers: headers,
    );

    // log('log me', name: response.body);

    // debugPrint("status code....."+response.statusCode.toString());


    if (response.statusCode == 200) {
      debugPrint("card call ....."+response.body);
      return cardModelFromJson(response.body);
    } else if (response.statusCode == 400) {
      throw const HttpException('getCustomerAddressData Error');
    } else {
      throw const HttpException('getCustomerAddressData Error');
    }
  }


}
