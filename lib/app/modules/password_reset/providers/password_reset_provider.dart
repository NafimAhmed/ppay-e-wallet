import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../util/app_constant.dart';
import 'package:http/http.dart' as http;

import '../../../util/app_local_stroge.dart';
import '../../../widgets/app_snackbar.dart';

class PasswordResetProvider extends GetConnect {


  Future<bool> resetUserPassword(String newPassword,String confirmPassword) async {
    var userData = {};
    userData['new_password'] = newPassword;
    userData['confirm_password'] = confirmPassword;



    final url = Uri.parse('${BASE_URL}change-password');

    // debugPrint("ressssssssssssssssssssssssssss" + userData.toString());
    //
    // // final url = Uri.parse('http://172.31.120.58:80/api/user-login');
    //
    // debugPrint("ressssssssssssssssssssssssssss" + url.toString());


    Map<String, String> headers = {
    "Authorization": "Bearer ${getStorage.read('token')}",
  };

    var response = await http.post(url, body: userData,headers: headers);

    debugPrint("ressssssssssssssssssssssssssss" + response.statusCode.toString());
    debugPrint("ressssssssssssssssssssssssssss" + response.body.toString());

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if(jsonResponse['success'] == true){
        showSnackBar('Password Change', '${jsonResponse['message']}', Colors.blueAccent, SnackPosition.BOTTOM);
        return true;
      }
      else {
        var jsonResponse = json.decode(response.body);
        showSnackBar("Caution",jsonResponse["message"],Colors.orangeAccent,SnackPosition.BOTTOM);
        await getStorage.write('loginStatus',false);
        debugPrint("status from login ......"+getStorage.read('loginStatus').toString());
        return false;
      }


    } else {
      showSnackBar("Failed","Could not changed password",Colors.red,SnackPosition.BOTTOM);
      await getStorage.write('loginStatus',false);
      debugPrint("status from login ......"+getStorage.read('loginStatus').toString());
      return false;
    }
  }
}
