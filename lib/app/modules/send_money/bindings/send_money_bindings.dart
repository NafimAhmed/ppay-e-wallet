


import 'package:get/get.dart';

import '../controller/send_money_controller.dart';


class SendMoneyBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<SendMoneyController>(() => SendMoneyController());
  }

}