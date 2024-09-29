import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:p_pay/app/widgets/app_snackbar.dart';

import '../../../util/app_constant.dart';

class SigninProvider extends GetConnect {

  Future<dynamic> doRegistration(
  String first_name,
  String last_name,
  String email,
  String password,
  String docs_type,
  String identification_number,
  String dob,
  String street_info,
  String address ,
  String post_code,
  String nationality,
  String phone_number,
  String address_1,
  String address_2) async {


    Map<String, String> userData = Map();
    userData['first_name'] = first_name;
    userData['last_name'] = last_name;
    userData['docs_type'] = docs_type;
    userData['phone_number'] = phone_number;
    userData['email'] = email;
    userData['password'] = password;
    userData['identification_number'] = identification_number;
    userData['dob'] = dob;
    userData['street_info'] = street_info;
    userData['address'] = address;
    userData['post_code'] = post_code;
    userData['nationality'] = nationality;
    userData['address_1'] = address_1;
    userData['address_2'] = address_2;

    debugPrint("userData" + userData.toString());
    //
    final url = Uri.parse(BASE_URL +'user-registration');


    var response = await http.post(url, body: userData);

    debugPrint("Response Code..................." + response.statusCode.toString());

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      debugPrint("Response body..................." + jsonResponse.toString());

      try {
        if (jsonResponse['success'] == true) {
          return true;
        } else {

          showSnackBar('Caution', jsonResponse["errors"],Colors.white, SnackPosition.BOTTOM);

          return false;
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    else {
      var jsonResponse = jsonDecode(response.body);
      showSnackBar('Caution', jsonResponse["errors"],Colors.white, SnackPosition.BOTTOM);
      return false;
    }
  }
}
