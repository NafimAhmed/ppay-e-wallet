



import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/routes/app_pages.dart';

import '../../../util/app_color.dart';
import '../../../util/app_constant.dart';
import '../../../util/app_size.dart';
import '../../base/views/qr_scanner.dart';
import '../../../widgets/submission_button.dart';
import '../../../widgets/transection_tile.dart';

class PaymentView extends GetView<GetxController>{


  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController textEditingController=TextEditingController();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/p_pay_logo_small.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),


          Container(
            height: 40,
            width: screenWidth / 2 + 60,
            decoration: BoxDecoration(
                color: AppColors.colorLightGrey.withOpacity(0.1)
            ),
            child: Padding(
              padding:  const EdgeInsets.only(
                  top: 2,
                  left: 10
              ),
              child: TextFormField(
                controller: textEditingController,
                decoration: InputDecoration(
                  isDense: true,
                    border: InputBorder.none,
                    hintText: 'Email, User Name, Phone Number',
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 14
                    )
                ),
              ),
            ),
          ),



          // Container(
          //   height: 40,
          //   width: 250,
          //   child: TextField(
          //     decoration: InputDecoration(
          //       hintText: 'Email, User name, Phone number',
          //       errorBorder: OutlineInputBorder(
          //         //<-- SEE HERE
          //         borderSide: BorderSide(width: 1, color: AppColors.colorBlack),
          //       ),
          //     ),
          //   ),
          // ),





          InkWell(
            onTap: (){

              debugPrint("qr pressed");
              Get.to(
                      () => QrScanner(textEditingController: textEditingController)
              );

             // Get.snackbar('QR Code Data', '${textEditingController.text}');
            },
            child: SvgPicture.asset(
              kSquareScanIcon,
            ),
          )
        ],
      ),
    ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Payment',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF060F27),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  const Icon(Icons.search)
                ],
              ),
            ),

            SizedBox(
              height: screenHeight * 0.3,
              child: ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const TransectionTile(
                      title: 'Netflix',
                      subtitle: 'Entertainment',
                      amount: '-\$ 10',
                      imageLink:
                      'https://variety.com/wp-content/uploads/2019/02/netflix-logo-originals.jpg?w=640',
                      amountColor: Colors.red);
                },
              ),
            ),


            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Payment',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF060F27),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  //Icon(Icons.search)
                ],
              ),
            ),


            SizedBox(
              height: screenHeight * 0.37,
              child: ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Get.toNamed(Routes.PAYMENT_FORM);
                    },
                    child: const TransectionTile(
                        title: 'Netflix',
                        subtitle: 'Entertainment',
                        amount: '-\$ 10',
                        imageLink:
                        'https://variety.com/wp-content/uploads/2019/02/netflix-logo-originals.jpg?w=640',
                        amountColor: Colors.red),
                  );
                },
              ),
            ),


            SubmissionButton(
              text: 'Payments',
              onTap: () {},
              height: 50,
              width: screenWidth * 0.75,
              color: AppColors.colorLightBlue,
              borderRadius: 10,
              borderColor: Colors.transparent,
            ),


          ],
        ),
      ),
    );
  }

}