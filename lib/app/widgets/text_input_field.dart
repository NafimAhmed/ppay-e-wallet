// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:p_pay/app/modules/login/controllers/login_controller.dart';

import '../util/app_color.dart';
import '../util/app_size.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({super.key,required this.textEditingController,required this.labelName,
  required this.controller});

  final TextEditingController textEditingController;
  final String labelName;
  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return

      SizedBox(
        height: screenHeight * 0.090,
        child:
        TextFormField(

          obscureText: labelName == "Enter password" ?controller.passwordVisible.value:false,
          // controller.passwordVisible.value == true
          //     ? false
          //     : true : false,
          cursorColor: AppColors.colorBlack,
          decoration: InputDecoration(


            // isCollapsed: true,
            // isDense: true,

            suffixIcon: IconButton(
                onPressed: () {
                  if (labelName == "Enter password") {
                    controller.passwordVisible.value == true
                        ? controller.passwordVisible.value = false
                        : controller.passwordVisible.value = true;
                  }

                },
                icon:

                labelName == "Enter password" ?
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



            focusedBorder:
            OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(
                  15.0),
              borderSide: const BorderSide(
                  color: Colors.grey,
                  width:
                  2.0),
            ),





            enabledBorder:
            OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(
                  12.0),
              borderSide:
              const BorderSide(
                color: Colors.grey,
                width:
                1.0,
              ),
            ),
            errorBorder:
            OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(
                  15.0),
              borderSide:
              const BorderSide(
                color: Colors.red,
                width:
                1.0,
              ),
            ),
            focusedErrorBorder:
            OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(
                  12.0),
              borderSide:
              const BorderSide(
                color: Colors.grey,
                width:
                1.0,
              ),
            ),
            labelStyle:
            const TextStyle(
              color:
              Colors.grey,),
            hintText:
            labelName,
            border: const OutlineInputBorder(
                borderSide:
                BorderSide(
                  color: Colors.grey,
                )
            ),
          ),
          onChanged:
              (String? value) {
            textEditingController.text = value!;

          },
          validator:
              (String?
          value) {
            return (value !=
                null &&
                value.contains(
                    '@'))
                ? 'Do not use the @ char.'
                : null;
          },
          controller:
          textEditingController,
        ),

      )

    //   Obx(() =>
    //
    //
    // )
    ;
  }
}
