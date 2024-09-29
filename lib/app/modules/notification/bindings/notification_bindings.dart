


import 'package:get/get.dart';
import 'package:p_pay/app/modules/notification/controller/notification_controller.dart';

class NotificationBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<NotificationController>(() => NotificationController());
  }

}