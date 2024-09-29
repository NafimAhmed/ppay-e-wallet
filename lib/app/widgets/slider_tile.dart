import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/util/app_size.dart';

class SliderTile extends StatelessWidget {
  final String imageLink;
  final String title;
  final String subTitle;

  const SliderTile(
      {super.key,
      required this.imageLink,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: [
          SvgPicture.asset(
            imageLink,
            height: screenHeight * 0.32,

          ),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),

           SizedBox(height: screenHeight * 0.020,),

          SizedBox(
            width: screenWidth * 0.88,
            child: Text(
              subTitle,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],

      ),
    );
  }
}
