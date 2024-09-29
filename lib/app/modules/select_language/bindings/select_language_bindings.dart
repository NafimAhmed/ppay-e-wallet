



import 'package:get/get.dart';
import 'package:p_pay/app/modules/select_language/controller/select_language_controller.dart';

class SelectLanguageBingings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<SelectLanguageController>(() => SelectLanguageController());
  }

}