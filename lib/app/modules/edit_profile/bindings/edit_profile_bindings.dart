

import 'package:get/get.dart';
import 'package:p_pay/app/modules/edit_profile/controller/edit_profile_controller.dart';

class EditProfileBindings extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<EditProfileController>(() => EditProfileController());
    // TODO: implement dependencies
  }

}