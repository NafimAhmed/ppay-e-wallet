import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/util/app_color.dart';
import 'package:p_pay/app/util/app_size.dart';

class CardFormat extends StatelessWidget {


  final String cardLastDigits;
  final String expiryDate;
  final String balance;
  final String currencySign;
  final String cardLogo;
  final Color color;


  const CardFormat(
      {super.key, required this.cardLastDigits, required this.expiryDate, required this.balance, required this.currencySign, required this.cardLogo, required this.color});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: screenWidth -20,
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(20),
      decoration: ShapeDecoration(
        color: color,//Color(0xFF3862F8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 42,
                          height: 28,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: Image.network(
                            cardLogo,
                            //'https://p7.hiclipart.com/preview/314/877/264/credit-card-debit-card-mastercard-logo-visa-go-vector-thumbnail.jpg',
                            height:42, width:28,)
                      ),
                      //const SizedBox(width: 16),
                      Text(
                        '**** $cardLastDigits',
                        style: GoogleFonts.poppins(
                          color: AppColors.colorLightWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 91),
                  Text(
                    expiryDate, //'02/24',
                    style: GoogleFonts.poppins(
                      color: AppColors.colorLightWhite,
                      fontSize: 16,

                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 31),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Balance',
                      style: GoogleFonts.poppins(
                        color: AppColors.colorLightWhite,
                        fontSize: 14,

                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    Text(
                      '$currencySign $balance',
                      style: GoogleFonts.poppins(
                        color: AppColors.colorLightWhite,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
