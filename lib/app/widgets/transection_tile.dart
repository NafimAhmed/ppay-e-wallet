// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransectionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final String imageLink;
  final Color amountColor;

  const TransectionTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.amount,
      required this.imageLink, required this.amountColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: ClipOval(
        child: Image.network(
          imageLink,
            //'https://variety.com/wp-content/uploads/2019/02/netflix-logo-originals.jpg?w=640',
            height: 50,
            width: 50,
            fit: BoxFit.cover),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              color: const Color(0xFF060F27),
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          Text(
            amount,
            style: GoogleFonts.poppins(
              color: amountColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ],
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.poppins(
          color: const Color(0xFF91949F),
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 0,
        ),
      ),
    );
  }
}
