import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
// import 'package:p_pay/app/routes/app_pages.dart';
import 'package:p_pay/app/util/app_color.dart';

import '../util/app_constant.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.colorLightWhite
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(18.0)
          )
        ),

        child:  Center(
          child: SvgPicture.asset(
            kArrowBackIcon,
          ),
        ),
      ),
    );
  }
}
