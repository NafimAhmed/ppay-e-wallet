import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../util/app_constant.dart';
import '../../../util/app_local_stroge.dart';
import '../model/transaction_model.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<TransactionModel?> fetchTransactionList() async {
    Map<String, String> headers = {
      "Authorization": "Bearer ${getStorage.read('token')}",
    };

    final url = Uri.parse('${BASE_URL}transactions');
    var response = await http.get(
      url,
      headers: headers,
    );

    // log('log me', name: response.body);

    // debugPrint("status code....."+response.statusCode.toString());


    if (response.statusCode == 200) {
      debugPrint("card call 111 ....."+response.body);
      return transactionModelFromJson(response.body);
    } else if (response.statusCode == 400) {
      throw const HttpException('getCustomerAddressData Error');
    } else {
      throw const HttpException('getCustomerAddressData Error');
    }
  }





  Future<void> getUserBalance() async {
    Map<String, String> headers = {
      "Authorization": "Bearer ${getStorage.read('token')}",
    };

    final url = Uri.parse('${BASE_URL}get-balance');
    var response = await http.get(
      url,
      headers: headers,
    );

    // log('log me', name: response.body);

    // debugPrint("status code....."+response.statusCode.toString());


    if (response.statusCode == 200) {
       var jsonResponse = jsonDecode(response.body);
       if(jsonResponse["success"] == true){
         currentBalance.value = jsonResponse["data"]["current_balance"];
         debugPrint("current balance.........."+currentBalance.toString());
       }
    } else if (response.statusCode == 400) {
      throw const HttpException('getCustomerAddressData Error');
    } else {
      throw const HttpException('getCustomerAddressData Error');
    }
  }






}
