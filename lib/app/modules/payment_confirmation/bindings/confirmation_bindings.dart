


import 'package:get/get.dart';

import '../controller/confirmation_controller.dart';
//import 'package:p_pay/app/modules/confirmation/controller/confirmation_controller.dart';

class PaymentConfirmationBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<PaymentConfirmationController>(() => PaymentConfirmationController());
  }

}