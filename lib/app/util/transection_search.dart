


// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// import '../widgets/box_text_field.dart';

class TransectionSearch extends StatelessWidget{


  RxBool isExpanded=false.obs;
  final String title;
  final Icon icon;
  final TextEditingController textEditingController;


   TransectionSearch({super.key, required this.title, required this.textEditingController, required this.icon});

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Container(
      height: 40,
      child: Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                title,
                style: GoogleFonts.poppins(
                        color: const Color(0xFF060F27),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
              ),
            ),
            visible: !isExpanded.value ,
          ),



          Visibility(
            child: Container(
              margin: EdgeInsets.fromLTRB(10,20,10,0),
              height: 40,
              width: Get.width-70,
              child: TextFormField(
                decoration: InputDecoration(
                  isCollapsed: true,
                  isDense: true,
                  hintText: 'Search Transection',
                ),
              )
              // BoxTextField(
              //   textEditingController: textEditingController,
              //   //textEditingController: SendMoneyFormController.receiverEmailController,
              //   labelName: 'Search Transection',
              //   //controller: receiverSigningController,
              // ),
            ),
            visible: isExpanded.value ,
          ),



          IconButton(onPressed: (){

            if(isExpanded.value==true){
              isExpanded.value=false;
            }else{
            isExpanded.value=true;
            }

          }, icon: icon)

        ],
      ),),


    );
  }


}