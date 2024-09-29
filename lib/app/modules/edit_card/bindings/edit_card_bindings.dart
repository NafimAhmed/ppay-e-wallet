



import 'package:get/get.dart';
import 'package:p_pay/app/modules/edit_card/controller/edit_card_controller.dart';

class EditCardBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<EditCardControllers>(() => EditCardControllers());
  }

}