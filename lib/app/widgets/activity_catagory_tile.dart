import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/util/app_size.dart';

class ActivityCatagoryTile extends StatelessWidget {


  final Widget icon;
  final String title;
  final String amount;

  const ActivityCatagoryTile({super.key, required this.icon, required this.title, required this.amount});



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(10),
      height: screenWidth*0.35,
      width: screenWidth*0.30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          icon,

          const SizedBox(height: 10,),

          Text(
            title,
            style: GoogleFonts.roboto(
              color: const Color(0xFF6B7280),
              fontSize: 12,
              fontWeight: FontWeight.w400,

            ),
          ),


          const SizedBox(height: 10,),

          Text(
            amount,
            style: GoogleFonts.roboto(
              color: const Color(0xFF1D3A6F),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          )


        ],
      ),
    );
  }
}
