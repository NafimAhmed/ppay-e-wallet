




import 'package:get/get.dart';
import 'package:p_pay/app/modules/account_info/controller/account_info_controller.dart';

class AccountInfoBinndings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<AccountInfoController>(() => AccountInfoController());



  }

}