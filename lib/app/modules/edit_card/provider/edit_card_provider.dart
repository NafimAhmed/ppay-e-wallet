import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_pay/app/util/app_color.dart';

import '../../../util/app_constant.dart';
import 'package:http/http.dart' as http;
import '../../../util/app_local_stroge.dart';
import '../../../widgets/app_snackbar.dart';
import '../../my_card/controller/my_card_controller.dart';

class EditCardProvider extends GetConnect {

  final MyCardController myCardController = Get.put(MyCardController());

  Future<dynamic> deleteUserDebitOrCreditCard(String cardID) async {
     Map<String,dynamic> CardData = {};
    CardData['card_id'] = cardID;


     Map<String, String> headers = {
       "Authorization": "Bearer ${getStorage.read('token')}",
     };

    final url = Uri.parse('${BASE_URL}delete-card/$cardID');

     debugPrint("first function calll associate................."+url.toString());


     debugPrint("ressssssssssssssssssssssssssss add card data" + CardData.toString());


    var response = await http.post(url, body: CardData,headers: headers);



     debugPrint("ressssssssssssssssssssssssssss add card status code" + response.statusCode.toString());
     debugPrint("ressssssssssssssssssssssssssss add card body" + response.body.toString());
     debugPrint("ressssssssssssssssssssssssssss add card token" + getStorage.read('token').toString());

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      try {
        if (jsonResponse['status'] == 200) {

          showSnackBar('Success', '${jsonResponse['message']}', AppColors.colorBlue, SnackPosition.BOTTOM);

          await myCardController.getUserCardList();

          return true;
        } else {

          showSnackBar("Caution",jsonResponse["message"],Colors.orangeAccent,SnackPosition.BOTTOM);
          return false;
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      return false;
    }
  }
}
