import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey ='pk_test_51OZ7s1J979QbIB3VAi2RAquPbb6ZtmU5QM3tYxRULhlCKed4kuersJAKgp24xUNBje9H31JrUZ5leERnAWNCMOwc00Yn7x2RLQ';



  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await GetStorage.init('p_pay_storage');

  InternetAddress.lookup("http://10.81.10.14:83").then((value) {
    value.forEach((element) async {
      print("ip................"+element.address);
    });
  });

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
