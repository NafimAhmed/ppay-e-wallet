



import 'package:get/get.dart';
import 'package:p_pay/app/modules/start_screen/controllers/start_screen_controller.dart';

class StartCaroselScreenBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<StartScreenController>(() => StartScreenController());
  }

}