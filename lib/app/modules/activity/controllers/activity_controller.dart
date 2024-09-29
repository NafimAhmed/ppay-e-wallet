import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ActivityController extends GetxController {
  //TODO: Implement ActivityController

  final count = 0.obs;


  TextEditingController transectionSearchController=TextEditingController();

  void increment() => count.value++;
}
