import 'package:flutter/cupertino.dart';
import 'package:p_pay/app/util/app_color.dart';
import 'package:p_pay/app/util/app_size.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class IndicatorLine extends StatelessWidget {
  const IndicatorLine({super.key,required this.percent});

  final double percent;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      width: screenWidth,
      padding: EdgeInsets.zero,
      lineHeight: 08.0,
      percent: percent,
      progressColor: AppColors.colorBlue,
      backgroundColor: AppColors.colorLightWhite,
    );
  }
}
