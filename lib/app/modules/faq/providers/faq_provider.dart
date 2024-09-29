import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../util/app_constant.dart';
import '../../../util/app_local_stroge.dart';
import '../model/faq_model.dart';
import 'package:http/http.dart' as http;

class FaqProvider extends GetConnect {

  Future<FaqModel> fetchUserFaq() async {
    Map<String, String> headers = {
      "Authorization": "Bearer ${getStorage.read('token')}",
    };

    final url = Uri.parse('${BASE_URL}faq');
    var response = await http.get(
       url,
      headers: headers,
    );

    debugPrint(""+response.statusCode.toString());


    if (response.statusCode == 200) {
      debugPrint(response.body);
      return faqModelFromJson(response.body);
    } else if (response.statusCode == 400) {
      throw const HttpException('getCustomerAddressData Error');
    } else {
      throw const HttpException('getCustomerAddressData Error');
    }
  }

  Future<FaqModel> fetchUserFaqList() async {
    Map<String, String> headers = {
      "Authorization": "Bearer ${getStorage.read('token')}",
    };

    final url = Uri.parse('${BASE_URL}faq-list');
    var response = await http.get(
      url,
      headers: headers,
    );

    debugPrint(""+response.statusCode.toString());


    if (response.statusCode == 200) {
      debugPrint(response.body);
      return faqModelFromJson(response.body);
    } else if (response.statusCode == 400) {
      throw const HttpException('getCustomerAddressData Error');
    } else {
      throw const HttpException('getCustomerAddressData Error');
    }
  }

  Future<FaqModel> fetchSearchFaqList(String keyword) async {

   Map<String , String> userData = {};
    userData['keyword'] = keyword;


    Map<String, String> headers = {
      "Authorization": "Bearer ${getStorage.read('token')}",
    };

    final url = Uri.parse('${BASE_URL}search-faq');
    var response = await http.post(
      url,
      headers: headers,
      body: userData
    );

    debugPrint(""+response.statusCode.toString());


    if (response.statusCode == 200) {
      debugPrint(response.body);
      return faqModelFromJson(response.body);
    } else if (response.statusCode == 400) {
      throw const HttpException('getCustomerAddressData Error');
    } else {
      throw const HttpException('getCustomerAddressData Error');
    }
  }

}
