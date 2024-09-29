import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:p_pay/app/modules/profile/controllers/profile_controller.dart';

import '../../../util/app_constant.dart';
import 'package:http/http.dart' as http;

import '../../../util/app_local_stroge.dart';
import '../../../widgets/app_snackbar.dart';

class ProfileProvider extends GetConnect {




  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<dynamic> doUserLogout() async {
    final String? logInToken = getStorage.read('token');

    final url = Uri.parse(BASE_URL + 'user-logout');

    var response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $logInToken'},
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      debugPrint(jsonResponse['status'].toString());

      try {
        if (jsonResponse['status'] == 200) {
          return true;
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      return true;
    }
  }



  Future<String> imageUpload(String file_path, File? image_file) async {
    FormData userData = FormData({

      'profile_pic': image_file == null
          ? null
          : MultipartFile(image_file,
          filename: DateTime.now().toString() + file_path),
    });
    debugPrint('File Pathe from proider---------------------------$file_path');



    debugPrint('File Pathe ---------------------------$file_path');



    final url = '${BASE_URL}change-profile-pic';



    Map<String, String> headers = {
      "Authorization": "Bearer ${getStorage.read('token')}",
    };

    var response = await post(url, userData,headers: headers);




    debugPrint("ressssssssssssssssssssssssssss${response.statusCode}");
    debugPrint("ressssssssssssssssssssssssssss${response.body}");

    if (response.statusCode == 200) {


        showSnackBar('Image Upload', '${response.body['message']}', Colors.blueAccent, SnackPosition.BOTTOM);
        //
        // debugPrint('get storage start ----------------------------------------');
        //
        // await getStorage.write("profile_picture", "$IMAGE_BASE_URL${response.body['data']['path']}");


        debugPrint('get storage end ----------------------------------------${getStorage.read("profile_picture")}');



        return '${response.body['data']["path"]}';



    } else {
      showSnackBar("Failed","Could not changed Profile picture ",Colors.red,SnackPosition.BOTTOM);
      await getStorage.write('loginStatus',false);
      debugPrint("status from login ......"+getStorage.read('loginStatus').toString());
      return "";
    }
  }


}
