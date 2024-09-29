




import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:p_pay/app/util/app_color.dart';
// import 'package:p_pay/app/util/app_size.dart';

class SubmissionButton extends StatelessWidget{

  final String text;
  final Callback onTap;
  final double height;
  final double width;
  final double borderRadius;
  final Color color;
  final Color borderColor;
  final textStyle;



  const SubmissionButton({super.key, required this.text, required this.onTap, required this.height, required this.width, required this.color, required this.borderRadius, this.textStyle, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.colorLightWhite, backgroundColor: color, side: BorderSide(color: borderColor, width: 1),
        // shadowColor: Colors.greenAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius,

          ),

        ),
        minimumSize: Size(width, height), //////// HERE
      ),

      onPressed: onTap,
      child: Text(text,
        style: textStyle ?? const TextStyle(
            fontSize: 12,
            color: AppColors.colorLightWhite

        ),
      ),
    );
  }

}