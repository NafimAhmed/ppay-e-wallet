// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';


showSnackBar(String title,String message,Color backgroundColor,SnackPosition snackPosition){
  return  Get.snackbar(
    title,
    message,
    colorText: Colors.white,
    backgroundColor: backgroundColor,
    snackPosition: snackPosition,
  );
}
