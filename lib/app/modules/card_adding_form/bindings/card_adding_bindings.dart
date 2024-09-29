




import 'package:get/get.dart';
import 'package:p_pay/app/modules/card_adding_form/controller/card_adding_controller.dart';

class CardAddingBindings extends Bindings{
  @override
  void dependencies() {


    Get.lazyPut<CardAddingController>(() => CardAddingController());
    // TODO: implement dependencies
  }

}