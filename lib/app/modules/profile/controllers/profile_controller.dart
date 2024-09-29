
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:p_pay/app/widgets/app_snackbar.dart';

import '../../../routes/app_pages.dart';
// import '../../../util/app_constant.dart';
import '../../../util/app_local_stroge.dart';
import '../providers/profile_provider.dart';

class ProfileController extends GetxController {
  //TODO: Implement


  //RxString profilePicURL ='$IMAGE_BASE_URL${getStorage.read('profile_picture').toString()}'.obs;
  RxBool profilepicLoader=false.obs;



  Future<void> checkLogout() async {
    var logoutStatus = await ProfileProvider().doUserLogout();

    if (logoutStatus == true) {
      _changeLogoutStatus();
    } else {
      showSnackBar("Logout", "Logged out unsuccessful", Colors.red,
          SnackPosition.BOTTOM);
    }
  }

  _changeLogoutStatus() async {
    await getStorage.write('token', "");
    await getStorage.write("loginStatus", false);
    Get.offNamed(Routes.START_SCREEN_CAROSEL);
    showSnackBar("Logout", "Logged out successful", Colors.blue,
        SnackPosition.BOTTOM);
  }


  Future<void> getImageData() async {
    final XFile? response = (await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 5));
    if (response != null) {

      profilepicLoader.value = true;

     String imgPath = await ProfileProvider().imageUpload(response.path, File(response.path));
     //profilePicURL.value ='$IMAGE_BASE_URL$imgPath';
      await getStorage.write("profile_picture", "$imgPath");


      profilepicLoader.value = false;


    } else {
      return null;
    }

  }
}

