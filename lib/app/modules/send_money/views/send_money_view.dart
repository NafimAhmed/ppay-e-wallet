import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/routes/app_pages.dart';
import 'package:p_pay/app/util/app_color.dart';
import 'package:p_pay/app/util/app_size.dart';
import 'package:p_pay/app/modules/base/views/qr_scanner.dart';
import 'package:p_pay/app/widgets/submission_button.dart';
import 'package:p_pay/app/widgets/transection_tile.dart';

import '../../../util/app_constant.dart';
import '../controller/send_money_controller.dart';

class SendMoneyViews extends GetView<SendMoneyController> {
  const SendMoneyViews({super.key});


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
                  image: AssetImage(kAppSmallImg),
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
                padding: const EdgeInsets.only(
                    top: 0,
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
            InkWell(
              onTap: (){

                debugPrint("qr pressed");
                Get.to(
                        () => QrScanner(textEditingController: textEditingController)
                );

                //Get.snackbar('QR Code Data', textEditingController.text);
              },
              child: SvgPicture.asset(
                kSquareScanIcon,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [


                    Container(

                      //height: 100,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context,index){
                            return ListTile(
                              onTap: (){
                                Get.toNamed(Routes.SEND_MONEY_FORM);
                              },
                              leading: ClipOval(
                                child: Image.network(
                                    'https://variety.com/wp-content/uploads/2019/02/netflix-logo-originals.jpg?w=640',
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover),
                              ),
                              title: const Text("Netflix"),
                              subtitle: const Text("Entertainment"),
                            );
                          }),
                    ),

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent Transactions',
                            style: GoogleFonts.poppins(
                              color: AppColors.colorDeepBlue,//Color(0xFF060F27),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          const Icon(Icons.search),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: screenHeight * 0.75,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 20,
                              itemBuilder: (context, index) {
                                return const TransectionTile(
                                  title: 'Netflix',
                                  subtitle: 'Entertainment',
                                  amount: '-\$ 10',
                                  imageLink:
                                  'https://variety.com/wp-content/uploads/2019/02/netflix-logo-originals.jpg?w=640',
                                  amountColor: AppColors.colorRed,//Colors.red
                                );
                              },
                            ),
                          ),

                          Container(
                            height: 135,
                            color: AppColors.colorLightWhite,
                          )


                        ],
                      ),
                    ),




                  ],
                ),
              ),
              Positioned(
                top: screenHeight - 80,
                left: screenWidth * 0.10,
                child: SubmissionButton(
                  text: 'Send Money',
                  onTap: () {},
                  height: 60,
                  width: screenWidth * 0.80,
                  color: AppColors.colorLightBlue,
                  borderRadius: 10,
                  borderColor: Colors.transparent,
                  textStyle: const TextStyle(
                      fontSize: 17,
                      color: AppColors.colorLightWhite
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
