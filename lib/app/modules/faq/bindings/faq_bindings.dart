




import 'package:get/get.dart';
import 'package:p_pay/app/modules/faq/controller/faq_controller.dart';

class FAQBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<FAQController>(() => FAQController());
  }

}