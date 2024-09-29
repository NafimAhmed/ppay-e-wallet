




import 'package:get/get.dart';
import 'package:p_pay/app/modules/my_qr_code/controller/my_qr_code_controller.dart';

class MyQRCodeBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<MyQRCodeController>(() => MyQRCodeController());



  }

}