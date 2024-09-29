import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:p_pay/app/widgets/app_snackbar.dart';

class NotificationController extends GetxController {
  late ScrollController scrollController;

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      debugPrint(
          "-----------------------------------------------------New page");

      //showSnackBar('Scroll', 'This is last', Colors.red, SnackPosition.BOTTOM);
      // Load more data when the user reaches the end of the list
      // if ((totoalCount ?? 0) > myApprovalList.value.length) {
      //   // _loadMoreData();
      //   getMyApproval(startRow: myApprovalList.value.length);
      // }
      // debugPrint('Load More Data${myApprovalList.value.length}');
    } else {
      debugPrint("dsfsdfsdfsdf");
    }
  }

  @override
  void onInit() {
    scrollController = ScrollController();
    super.onInit();
  }

  @override
  void onReady() {
    scrollController.addListener(_scrollListener);
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
