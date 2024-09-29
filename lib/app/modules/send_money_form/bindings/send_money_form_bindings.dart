


import 'package:get/get.dart';
import 'package:p_pay/app/modules/send_money_form/controller/send_money_form_controller.dart';

class SendMoneyFormBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<SendMoneyFormController>(() => SendMoneyFormController());


  }

}