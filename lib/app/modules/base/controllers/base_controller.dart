import 'package:get/get.dart';
import 'package:p_pay/app/modules/base/providers/base_provider.dart';

import '../../send_money_form/controller/send_money_form_controller.dart';

class BaseController extends GetxController {
  //TODO: Implement BaseController




  Future<void> getqr(String qrData) async {

    SendMoneyFormController.receiverEmailController.text = await BaseProvider().fetchUserQRData(qrData);

  }


}
