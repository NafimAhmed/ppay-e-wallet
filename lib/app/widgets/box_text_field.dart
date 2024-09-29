// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:p_pay/app/modules/login/controllers/login_controller.dart';
// import 'package:p_pay/app/modules/signin/controllers/signin_controller.dart';
import 'package:p_pay/app/util/app_color.dart';

// import '../util/app_size.dart';

class BoxTextField extends StatelessWidget {
  const BoxTextField({super.key,required this.textEditingController,required this.labelName,
     this.controller});

  final TextEditingController textEditingController;
  final String labelName;
  final controller;

  @override
  Widget build(BuildContext context) {

    RxString label=labelName.obs;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.colorGreyLight,
      ),


      child: Obx(()=>TextFormField(
        controller: textEditingController,
        obscureText: label.value=="Password"?controller.passwordVisible.value == true
            ? false
            : true:false,
        //obscureText: false,
        cursorColor: AppColors.colorBlack,
        decoration: InputDecoration(

          // prefixIcon: Icon(Icons.search),



          suffixIcon: IconButton(
              onPressed: () {
                if (labelName == "Password") {
                  controller.passwordVisible.value == true
                      ? controller.passwordVisible.value = false
                      : controller.passwordVisible.value = true;
                }

              },
              icon:

              labelName == "Password" ?
              controller.passwordVisible.value == true
                  ?
              const Icon(
                Icons.visibility,
                color: AppColors.colorBlack,
              )
                  : const Icon(
                Icons.visibility_off,
                color: Colors.grey,
              )  :  const Visibility(
                visible: false,
                child: Icon(Icons.label),
              )

          ),





          hintStyle: GoogleFonts.poppins(
            color: AppColors.colorBlack.withOpacity(0.5),
          ),
          hintText: labelName,





          border: InputBorder.none,
        ),
        onChanged: (String? value) {
          //textEditingController.text = value!;
        },

        // controller: textEditingController,
      )),
    );
  }
}
