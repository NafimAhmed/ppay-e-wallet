// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:p_pay/app/modules/signin/controllers/signin_controller.dart';

import '../util/app_color.dart';
import '../util/app_size.dart';

class BoxDropdown extends StatefulWidget {



   BoxDropdown({super.key,required this.menuItem,required this.hintText, required this.borderRadious, this.signinController, this.selectedItem,});

  final List<String> menuItem;
    String? selectedItem;
   final String hintText;
   final double borderRadious;
   final  signinController;

  @override
  State<BoxDropdown> createState() => _BoxDropdownState();
}

class _BoxDropdownState extends State<BoxDropdown> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadious),
        color: AppColors.colorGrey,
      ),

      height:
      screenHeight *
          0.070,
      padding:
      const EdgeInsets
          .symmetric(
          vertical:
          10),
      child:

      DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(widget.hintText,style: GoogleFonts.poppins(
              color: Colors.grey
            ),),
          ),
          icon: const Padding(
            padding: EdgeInsets.only(
              top: 10.0,
              right: 15.0,
            ),
            child: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.colorBlack,
            ),
          ),
          onChanged: (val) {

             setState(() {
               widget.selectedItem=val;
               debugPrint(widget.selectedItem);
              widget.hintText == "Nationality" ?
              widget.signinController.nationality.value = widget.selectedItem :
               widget.signinController.docType.value = widget.selectedItem;
             });
          },
          value: widget.selectedItem,
          items: widget.menuItem.map((selectValue) {
            return DropdownMenuItem(
                value: selectValue,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenHeight * 0.019),
                  child: Text(selectValue),
                ));
          }).toList(),
        ),
      ),
    );
  }
}
