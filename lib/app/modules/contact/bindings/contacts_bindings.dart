




import 'package:get/get.dart';
import 'package:p_pay/app/modules/contact/controller/contacts_controller.dart';

class ContactBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<ContactController>(() => ContactController());


  }

}