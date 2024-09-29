import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:p_pay/app/modules/signin/controllers/signin_controller.dart';

import '../../../util/app_constant.dart';
import 'package:http/http.dart' as http;

import '../../../util/app_local_stroge.dart';
import '../../../widgets/app_snackbar.dart';

class LoginProvider extends GetConnect {


  Future<dynamic> verifyUserLogin(String email, String password) async {
    var userData = {};
    userData['email'] = email;
    userData['password'] = password;


    final url = Uri.parse(BASE_URL + 'user-login');

    debugPrint("ressssssssssssssssssssssssssss" + userData.toString());

    // final url = Uri.parse('http://172.31.120.58:80/api/user-login');

    debugPrint("ressssssssssssssssssssssssssss" + url.toString());

    var response = await http.post(url, body: userData);

    debugPrint("ressssssssssssssssssssssssssss" + response.statusCode.toString());
    debugPrint("ressssssssssssssssssssssssssss" + response.body.toString());

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      try {
        if (jsonResponse['status'] == 200) {
          debugPrint("ressssssssssssssssssssssssssss11111111111" + jsonResponse.toString());

           await getStorage.write('token', jsonResponse['token']);
          await getStorage.write('first_name', jsonResponse['user']['first_name']);
          await getStorage.write('user_id', jsonResponse['user']['id']);
          await getStorage.write('email', jsonResponse['user']['email']);
          await getStorage.write('last_name', jsonResponse['user']['last_name']);
          await getStorage.write('phone', jsonResponse['user']['phone_number']);
          await getStorage.write('address1', jsonResponse['user']['address_1']);
          await getStorage.write('address2', jsonResponse['user']['address_2']);
          await getStorage.write('nationality', jsonResponse['user']['nationality']);
          await getStorage.write('profile_picture', jsonResponse['user']['profile_pic']);
          await getStorage.write('qr_code', jsonResponse['user']['qr_code']);


          // await _getStorage.write('userMail', jsonResponse['user']['email']);
          // await _getStorage.write(
          //     'isVerified', jsonResponse['user']['isVerified']);
          // await _getStorage.write(
          //     'OfficeID', jsonResponse['user']['OfficeID'].toString());
          // await _getStorage.write(
          //     'userPhone', jsonResponse['user']['userPhone'].toString());
          // await _getStorage.write(
          //     'userRole', jsonResponse['user']['roles'][0]['name'].toString());

          return true;
        } else {

          showSnackBar("Caution",jsonResponse["message"],Colors.orangeAccent,SnackPosition.BOTTOM);
          await getStorage.write('loginStatus',false);
          debugPrint("status from login ......"+getStorage.read('loginStatus').toString());
          return false;
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      var jsonResponse = json.decode(response.body);
      showSnackBar("Caution",jsonResponse["message"],Colors.orangeAccent,SnackPosition.BOTTOM);
      await getStorage.write('loginStatus',false);
      debugPrint("status from login ......"+getStorage.read('loginStatus').toString());
      return false;
    }
  }





}
