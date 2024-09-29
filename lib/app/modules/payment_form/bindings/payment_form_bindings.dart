


import 'package:get/get.dart';

import '../controller/payment_form_controller.dart';
// import 'package:p_pay/app/modules/send_money_form/controller/send_money_form_controller.dart';

class PaymentFormBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<PaymentFormController>(() => PaymentFormController());


  }

}