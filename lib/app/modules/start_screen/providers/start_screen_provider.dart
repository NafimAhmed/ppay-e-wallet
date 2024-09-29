import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../widgets/app_snackbar.dart';

class StartScreenProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }



  Future<dynamic> loadCountry() async {




    // final url = Uri.parse(BASE_URL + 'user-login');
    //
    // debugPrint("ressssssssssssssssssssssssssss" + userData.toString());

    // final url = Uri.parse('http://172.31.120.58:80/api/user-login');

    debugPrint(" Function is called-------------------------------------------");

    var response = await http.get(Uri.parse('https://raw.githubusercontent.com/NafimAhmed/country-list/main/country_list.json'));

    // debugPrint("ressssssssssssssssssssssssssss" + response.statusCode.toString());
     debugPrint("resss Country----------------------------------" + response.body.toString());




    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);



    } else {

      showSnackBar("Caution",'${response.statusCode}',Colors.red,SnackPosition.BOTTOM);

    }
  }



}
