




import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:p_pay/app/widgets/app_snackbar.dart';


class APICommunication {

  final String BASE_URL='http://127.0.0.1:8000';

  Future<http.Response> postRequest(Map<String,dynamic> Data, String endPoint) async {

    final url = Uri.parse('$BASE_URL$endPoint');

    http.Response response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(Data));

    // print("Response Code..................." + response.statusCode.toString());
    // print("Response Code..................." + response.body.toString());

    if (response.statusCode == 200) {

      showSnackBar('Success', 'A link has been sent to your email', Colors.green, SnackPosition.BOTTOM);
      // Get.snackbar(
      //   "Success",
      //   "A link has been sent to your email",
      //   colorText: Colors.white,
      //   backgroundColor: Colors.orangeAccent,
      //   snackPosition: SnackPosition.BOTTOM,
      // );
    }else{
      showSnackBar('Error ${response.statusCode}', response.body, Colors.red, SnackPosition.BOTTOM);

      // Get.snackbar(
      //   "Error ${response.statusCode}",
      //   response.body,
      //   colorText: Colors.white,
      //   backgroundColor: Colors.orangeAccent,
      //   snackPosition: SnackPosition.BOTTOM,
      // );
    }

    print("Password reset response code--------------------${response.statusCode}");


    return response;

  }






  Future<Map<String,dynamic>> getProductName(String endPoint) async {
   // isShopProductLoading.value = true;
    // print("response shop detail start point ............");

    Map<String, dynamic> apiMap;


    var response = await http.get(
      Uri.parse('$BASE_URL$endPoint'),
      // headers: {
      //   'Authorization': 'Bearer $token',
      // }
    );

    if (response.statusCode == 200) {
      apiMap = jsonDecode(response.body);


    } else {

      apiMap={};
      apiMap['message']='${response.statusCode}';

    }

    return apiMap;

  }



}