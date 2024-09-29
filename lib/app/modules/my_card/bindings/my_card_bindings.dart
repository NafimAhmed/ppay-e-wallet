



import 'package:get/get.dart';
import 'package:p_pay/app/modules/my_card/controller/my_card_controller.dart';

class MycardBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<MyCardController>(() => MyCardController());

  }

}