



import 'package:get/get.dart';
import 'package:p_pay/app/modules/payment/controller/payment_controller.dart';

class PaymentBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<PaymentController>(() => PaymentController());
  }

}