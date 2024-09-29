import 'package:get/get.dart';
import 'package:p_pay/app/modules/start_screen/providers/start_screen_provider.dart';

class StartScreenController extends GetxController {
  //TODO: Implement StartScreenController

  final count = 0.obs;

  RxBool isLoading = false.obs;


  // void increment() => count.value++;


  Future<void> countryloader() async {
    isLoading.value = true;

    var loadingStatus =StartScreenProvider().loadCountry();
    //await LoginProvider().verifyUserLogin(emailController.text, passwordController.text);

    if (loadingStatus == true) {
      isLoading.value = false;

    } else {
      isLoading.value = false;

    }
  }

  @override
  void onClose() {

  }

  @override
  void onReady() {

  }

  @override
  void onInit() {
    countryloader();
  }
}
