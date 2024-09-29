





import 'package:get/get.dart';
import 'package:p_pay/app/modules/password_reset/controller/password_reset_controller.dart';

class PasswordResetBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<PasswordResetController>(() => PasswordResetController());
  }

}