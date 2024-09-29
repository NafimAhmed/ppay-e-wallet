


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p_pay/app/util/app_color.dart';
import 'package:p_pay/app/util/app_size.dart';

class ConfirmationCardTemplate extends StatelessWidget{



  final String cardName;
  final String cardNumber;
  final String expDate;
  const ConfirmationCardTemplate({super.key, required this.cardName, required this.cardNumber, required this.expDate});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding:  EdgeInsets.only(
        // left: screenWidth * 0.050,
            bottom: screenHeight * 0.010,
      ),
      child: SizedBox(
        width: 327,
        height: 190,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 327,
                height: 190,
                decoration: ShapeDecoration(
                  color: AppColors.colorDeepBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: SizedBox(
                width: 327,
                height: 190,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 327,
                        height: 190,
                        decoration: ShapeDecoration(
                          color: AppColors.colorDeepBlue.withOpacity(.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 20,
                      child: SizedBox(
                        width: 72,
                        height: 32,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 4,
                              child: SizedBox(
                                width: 32,
                                height: 24.38,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 32,
                                        height: 24.38,
                                        decoration: ShapeDecoration(
                                          color: AppColors.colorLightWhite,
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(width: 0.50, color: Color(0xFF1D3A6F)),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 40,
                              top: 0,
                              child: Container(
                                width: 32,
                                height: 32,
                                padding: const EdgeInsets.all(4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Transform(
                                      transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                                      child: SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: -4.85,
                                              top: 2,
                                              child: Transform(
                                                transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                                                child: const SizedBox(
                                                  width: 20,
                                                  height: 14.30,
                                                  child: Stack(children: []),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                     Positioned(
                      left: 20,
                      top: 85,
                      child: Text(
                        '**** **** **** '+'${cardNumber}'.substring(cardNumber.length -4, cardNumber.length),





                        style: TextStyle(
                          color: AppColors.colorLightWhite,
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          height: 0.11,
                          letterSpacing: 0.30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 126,
              child: Container(
                width: 327,
                height: 64,
                decoration: const ShapeDecoration(
                  color: Color(0xFF3862F8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                ),
              ),
            ),
             Positioned(
              left: 20,
              top: 136,
              child: SizedBox(
                //width: 83,
                height: 38,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${cardName}',
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColors.colorLightWhite,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        height: 0.11,
                        letterSpacing: 0.30,
                      ),
                    ),
                    SizedBox(height: 20),
                    Opacity(
                      opacity: 0.60,
                      child: Text(
                        '${expDate}',
                        style: TextStyle(
                          color: AppColors.colorLightWhite,
                          fontSize: 10,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          height: 0.15,
                          letterSpacing: 0.30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 264,
              top: 142,
              child: SizedBox(
                width: 43,
                height: 26,
                child: Stack(
                  children: [
                    Positioned(
                      left: 17,
                      top: 0,
                      child: Opacity(
                        opacity: 0.50,
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: const ShapeDecoration(
                            color: AppColors.colorLightWhite,
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Opacity(
                        opacity: 0.80,
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: const ShapeDecoration(
                            color: AppColors.colorLightWhite,
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}