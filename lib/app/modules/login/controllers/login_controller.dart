
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../providers/login_provider.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var passwordVisible = false.obs;
  RxBool isSignInChecked = false.obs;
  RxBool isLoading = false.obs;



  Future<void> signInUser() async {
    isLoading.value = true;

    var logInStatus =
    await LoginProvider().verifyUserLogin(emailController.text, passwordController.text);

    if (logInStatus == true) {
      isLoading.value = false;
      Get.offNamed(Routes.BASE);
    } else {
      isLoading.value = false;
      isSignInChecked.value = false;
    }
  }
}
