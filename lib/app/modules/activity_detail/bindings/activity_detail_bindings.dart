




import 'package:get/get.dart';
import 'package:p_pay/app/modules/activity_detail/controller/activity_detail-controller.dart';

class ActivityDetailBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<ActivityDetailController>(() => ActivityDetailController());
  }

}