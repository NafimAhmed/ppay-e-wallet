import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_pay/app/modules/signin/providers/otp_provider.dart';
import 'package:p_pay/app/widgets/app_snackbar.dart';
import '../../../routes/app_pages.dart';
import '../../../services/api_communication.dart';
import '../providers/signin_provider.dart';
import '../views/login_after_otp.dart';
import '../views/otp_view.dart';

class SigninController extends GetxController {
  //TODO: Implement SigninController


  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController postCodeController = TextEditingController();
  TextEditingController addressLine2Controller =TextEditingController();
  TextEditingController addressLine1Controller = TextEditingController();
  TextEditingController docController = TextEditingController();
  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();




  RxBool isLoading = false.obs;
  RxBool isOTPLoading = false.obs;


  RxString mobileNumber = "".obs;
  var passwordVisible = false.obs;
  RxString nationality = "".obs;
  RxString docType = "".obs;
  RxString documentNumber = "".obs;
  String userOtp = '';


  Future<void> signUpUser() async {
    isLoading.value = true;
    var status = await SigninProvider().doRegistration(
     firstNameController.text,
      lastNameController.text,
      emailController.text,
      passwordController.text,
      docType.value,
        docController.text,
      dateController.text,'null',
      '${addressLine1Controller.text},'
          '${addressLine2Controller.text}',
      postCodeController.text,nationality.value,
        mobileNumber.value,
        addressLine1Controller.text,
        addressLine2Controller.text
    );

    debugPrint("reg status ..........." + status.toString());

    if (status == true) {

      isLoading.value = false;

      showSnackBar('Status', 'Registration Successful', Colors.blue, SnackPosition.BOTTOM);


      Get.offNamed(Routes.LOGIN);
    } else {
      isLoading.value = false;
    }
  }






  Future<void> otpSender() async {
    isOTPLoading.value = true;
    var status = await OTPProvider().sendUserOtp(mobileNumber.value);

    debugPrint("reg status ..........." + status.toString());

    if (status == true) {
      isOTPLoading.value = false;
      Get.to(() => OtpView());
    } else {
      isOTPLoading.value = false;
    }
  }




  Future<void> userOtpVerify() async {
    isOTPLoading.value = true;
    userOtp  =otpController1.text+otpController2.text+otpController3.text+otpController4.text;
    var status = await OTPProvider().verifyUserOtp(mobileNumber.value,userOtp);

    debugPrint("reg status ..........." + status.toString());

    if (status == true) {

      isOTPLoading.value = false;
      Get.off(() => LoginAfterOtp());
    } else {
      isOTPLoading.value = false;
    }
  }
}
