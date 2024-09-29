



import 'package:get/get.dart';
import 'package:p_pay/app/modules/general_settings/controller/general_settings_controller.dart';

class GeneralSettingBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<GeneralSettingController>(() => GeneralSettingController());
  }

}