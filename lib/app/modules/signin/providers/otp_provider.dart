import 'dart:convert';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:p_pay/app/modules/signin/controllers/signin_controller.dart';
import '../../../util/app_constant.dart';
import 'package:http/http.dart' as http;

import '../../../util/app_local_stroge.dart';
import '../../../widgets/app_snackbar.dart';

class OTPProvider extends GetConnect {


  Future<bool> sendUserOtp(String phoneNumber) async {
    var userData = {};
    userData['phone_number'] = phoneNumber;
    final url = Uri.parse('${BASE_URL}send-otp');

    debugPrint("ressssssssssssssssssssssssssss" + userData.toString());

    debugPrint("ressssssssssssssssssssssssssss" + url.toString());

    var response = await http.post(url, body: userData);

    debugPrint("ressssssssssssssssssssssssssss" + response.statusCode.toString());
    debugPrint("ressssssssssssssssssssssssssss" + response.body.toString());

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if(jsonResponse['success']==true){
        showSnackBar('OTP', '${jsonResponse['message']}', Colors.blueAccent, SnackPosition.BOTTOM);
        return true;
      }

      else {
        showSnackBar("Caution",jsonResponse["message"],Colors.orangeAccent,SnackPosition.BOTTOM);
        await getStorage.write('loginStatus',false);
        debugPrint("status from login ......"+getStorage.read('loginStatus').toString());
        return false;
      }


    } else {
      // var jsonResponse = json.decode(response.body);
      // showSnackBar("Caution",jsonResponse["message"],Colors.orangeAccent,SnackPosition.BOTTOM);
      // await getStorage.write('loginStatus',false);
      // debugPrint("status from login ......"+getStorage.read('loginStatus').toString());
      return false;
    }
  }

  Future<bool> verifyUserOtp(String phoneNumber,String oTP) async {
    var userData = {};
    userData['phone_number'] = phoneNumber;
    userData['otp_code'] = oTP;



    final url = Uri.parse('${BASE_URL}verify-otp');

    debugPrint("ressssssssssssssssssssssssssss" + userData.toString());

    // debugPrint("ressssssssssssssssssssssssssss" + url.toString());

    var response = await http.post(url, body: userData);

    // debugPrint("ressssssssssssssssssssssssssss" + response.statusCode.toString());
    debugPrint("ressssssssssssssssssssssssssss" + response.body.toString());

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if(jsonResponse['success'] == true){
        showSnackBar('OTP', '${jsonResponse['message']}', Colors.blueAccent, SnackPosition.BOTTOM);
        return true;
      }
      else{
        showSnackBar("Caution",jsonResponse["message"],Colors.orangeAccent,SnackPosition.BOTTOM);
        return false;
      }



    } else {
      // var jsonResponse = json.decode(response.body);
      // showSnackBar("Caution",jsonResponse["message"],Colors.orangeAccent,SnackPosition.BOTTOM);
      // await getStorage.write('loginStatus',false);
      // debugPrint("status from login ......"+getStorage.read('loginStatus').toString());
      return false;
    }
  }
}
