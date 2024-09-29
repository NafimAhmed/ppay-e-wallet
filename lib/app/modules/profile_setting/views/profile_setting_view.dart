import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../util/app_size.dart';
import '../../../widgets/arrow_back_button.dart';
import '../../../widgets/indicator_line.dart';
import '../controllers/profile_setting_controller.dart';

class ProfileSettingView extends GetView<ProfileSettingController> {
  const ProfileSettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.020,
                  left: screenWidth * 0.040),
              child: const ArrowBackButton(),
            ),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            const IndicatorLine(percent: 0.2,),

          ],
        ),
      ),
    );
  }
}
