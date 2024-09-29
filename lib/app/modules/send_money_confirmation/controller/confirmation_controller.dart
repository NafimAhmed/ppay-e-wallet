



import 'package:get/get.dart';
import 'package:p_pay/app/modules/send_money_confirmation/provider/send_money_confirmation_provider.dart';
import 'package:p_pay/app/modules/send_money_form/provider/send_money_form_provider.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/success_view.dart';

class SendMoneyConfirmationController extends GetxController{

  RxBool isMoneySendLoading = false.obs;

  @override
  void onInit() {

  }

  Future<void> sendMoneyToUser(String userId , String receiverId ,String transactionType , String transactionAmount) async{

    var status = await SendMoneyConfirmationProvider().sendMoney(userId , receiverId,transactionType,transactionAmount);
    if(status == true ){
      Get.to(
              () => SuccessView(amount: '${transactionAmount}')
      );
    }
    else {

    }
  }


}