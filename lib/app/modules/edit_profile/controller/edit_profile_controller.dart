



import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController{

  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  @override
  void onInit() {

    nameController=TextEditingController();
    addressController=TextEditingController();
    phoneController=TextEditingController();
    emailController=TextEditingController();

  }

  @override
  void onClose() {

    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    emailController.dispose();
  }

  @override
  void onReady() {

  }
}