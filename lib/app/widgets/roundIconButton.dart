import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/util/app_color.dart';

class RoundedIconButton extends StatelessWidget {
  final String text;
  final Icon icon;

  const RoundedIconButton({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: 78,
      height: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 64,
            height: 64,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration:  ShapeDecoration(
                      color: AppColors.colorLightWhite,
                      shape: const OvalBorder(),
                      shadows: [
                        BoxShadow(
                          color: AppColors.colorLightGrey.withOpacity(0.2),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 20,
                  child: Container(
                    width: 24,
                    height: 24,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: icon, //Stack(children: []),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: GoogleFonts.poppins(
              color: AppColors.colorDeepBlue,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
