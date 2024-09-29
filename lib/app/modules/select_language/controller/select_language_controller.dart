



import 'package:get/get.dart';

import '../../../util/app_local_stroge.dart';
import '../../../util/country_list.dart';

class SelectLanguageController extends GetxController{

  RxString groupValue = CountryList.languageList.first.obs;
  @override
  void onInit() {

    if(getStorage.read('language')!=null){
      groupValue.value=getStorage.read('language').toString();
    }

  }

  @override
  void onClose() {

  }

  @override
  void onReady() {

  }
}