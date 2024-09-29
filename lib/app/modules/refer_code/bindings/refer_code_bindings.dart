




import 'package:get/get.dart';

import '../controller/refer_code_controller.dart';

class ReferCodeBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ReferCodeController>(() => ReferCodeController());
  }

}