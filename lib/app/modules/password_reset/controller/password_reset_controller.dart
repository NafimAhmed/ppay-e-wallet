




// import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../providers/password_reset_provider.dart';

class PasswordResetController extends GetxController{


  RxString newPasswordController = ''.obs;
  RxString confirmPasswordController = ''.obs;
  RxBool isPasswordLoading = false.obs;





  //

  // void resetPass(){
  //   PasswordResetProvider().resetUserPassword(newPasswordController.value,confirmPasswordController.value);
  // }

  Future<void> resetUserPassword() async {
    isPasswordLoading.value = true;

    var logInStatus =
     await PasswordResetProvider().resetUserPassword(newPasswordController.value,confirmPasswordController.value);

    if (logInStatus == true) {
      isPasswordLoading.value = false;
    } else {
      isPasswordLoading.value = false;

    }
  }


  @override
  void onInit() {

  }

  @override
  void onClose() {

  }

  @override
  void onReady() {

  }
}