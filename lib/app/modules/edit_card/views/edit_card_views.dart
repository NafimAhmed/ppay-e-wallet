import 'package:flutter/material.dart';

// import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/modules/edit_card/controller/edit_card_controller.dart';
import 'package:p_pay/app/widgets/confirmation_card_template.dart';
import 'package:p_pay/app/widgets/submission_button.dart';

import '../../../util/app_color.dart';
import '../../../util/app_local_stroge.dart';
import '../../../util/app_size.dart';
import '../../../widgets/arrow_back_button.dart';
import '../../my_card/controller/my_card_controller.dart';

class EditCardView extends GetView<EditCardControllers> {




  //print(args);

   EditCardView({super.key});
  final MyCardController myCardController = Get.put(MyCardController());

  @override
  Widget build(BuildContext context) {
    RxBool freezPhysicalCard = false.obs;
    RxBool disableContactless = false.obs;


    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const ArrowBackButton(),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.095),
                      child: Text(
                        "My Card",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700, fontSize: 22),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              ConfirmationCardTemplate(
                cardName: '${controller.args['holder_name']}',
                cardNumber: '${controller.args['card_number']}',
                expDate: '${controller.args['exp_date']}',
              ),
              DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      Container(
                        height: screenHeight * 0.070,
                        width: screenWidth,
                        decoration: const BoxDecoration(
                            // color: Color(0xffE5E5E5),
                            ),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: TabBar(
                            indicatorSize: TabBarIndicatorSize.label,
                            indicator: const UnderlineTabIndicator(
                              borderSide: BorderSide(
                                width: 2,
                                color: AppColors.colorLightBlue,
                              ),
                              insets: EdgeInsets.symmetric(horizontal: 0),
                            ),
                            isScrollable: true,
                            dividerColor: AppColors.colorLightWhite,
                            tabs: [
                              Text(
                                'Personal',
                                style: GoogleFonts.roboto(
                                  color: const Color(0xFF1D3A6F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Manage',
                                style: GoogleFonts.roboto(
                                  color: const Color(0xFF1D3A6F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Detail',
                                style: GoogleFonts.roboto(
                                  color: const Color(0xFF1D3A6F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight / 2 - 100,
                        child: TabBarView(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        '${controller.args['holder_name']}',
                                        //'${getStorage.read('first_name').toString()} ${getStorage.read('last_name').toString()}',
                                        style: GoogleFonts.roboto(
                                          color: const Color(0xFF1D3A6F),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      leading: const Icon(Icons.credit_card),
                                    ),
                                    ListTile(
                                      title: Text(
                                        '${getStorage.read('address1').toString()} ${getStorage.read('address2').toString()}',
                                        style: GoogleFonts.roboto(
                                          color: const Color(0xFF1D3A6F),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      leading: const Icon(Icons.notes),
                                    ),
                                    ListTile(
                                      title: Text(
                                        '${getStorage.read('phone').toString()} ',
                                        style: GoogleFonts.roboto(
                                          color: const Color(0xFF1D3A6F),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      leading: const Icon(Icons.lock),
                                    ),

                                    //Html(data: "${shopController.apiShopProductDetailMap?["data"]["product"]["short_description"]}"),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Obx(
                                      () => SwitchListTile(
                                        title: Text(
                                          'Freeze physical card',
                                          style: GoogleFonts.roboto(
                                            color: const Color(0xFF1D3A6F),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        value: freezPhysicalCard.value,
                                        onChanged: (value) {
                                          freezPhysicalCard.value = value;
                                        },
                                        secondary:
                                            const Icon(Icons.credit_card),
                                      ),
                                    ),
                                    Obx(
                                      () => SwitchListTile(
                                        title: Text(
                                          'Disable contactless',
                                          style: GoogleFonts.roboto(
                                            color: const Color(0xFF1D3A6F),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        value: disableContactless.value,
                                        onChanged: (value) {
                                          disableContactless.value = value;
                                        },
                                        secondary: const Icon(Icons.notes),
                                      ),
                                    ),

                                    const ListTile(
                                      title: Text('Disable Magstrip'),
                                      leading: Icon(Icons.lock),
                                    )

                                    //Html(data: "${shopController.apiShopProductDetailMap?["data"]["product"]["short_description"]}"),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: ListView.builder(
                                  itemCount: 19,
                                  itemBuilder: (context, index) {
                                    return Text(
                                      "",
                                      style: GoogleFonts.ruluko(
                                        color: AppColors.colorLightBlue,
                                        fontSize: screenHeight * 0.016,
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              SubmissionButton(
                text: 'Delete Card',
                onTap: () async{







                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Confirm Delete'),
                      content: const Text('Do you want to delete the card ?'),
                      actions:[
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child:const Text('No'),
                        ),

                        ElevatedButton(
                          onPressed: () async {

                            controller.deleteUserCreditOrDebitCard();
                                  await myCardController.getUserCardList();
                                  Navigator.pop(context);
                                  Navigator.pop(context);

                          },
                          child:const Text('Confirm'),
                        ),

                      ],
                    ),
                  ) ;


                  // controller.DeleteUserCreditOrDebitCard(context);
                  //       await myCardController.getUserCardList();
                  //       Navigator.pop(context);





                },
                height: 70,
                width: screenWidth - 40,
                color: AppColors.colorLightBlue,
                borderRadius: 10,
                borderColor: AppColors.colorLightBlue,
                textStyle: GoogleFonts.roboto(fontSize: 17),
              )
            ],
          ),
        ),
      ),
    );
  }


   // showExitPopup()  async {
   //   return await showDialog(
   //     context: context,
   //     builder: (context) => AlertDialog(
   //       title: const Text('Exit P Pay'),
   //       content: Container(
   //         color: AppColors.colorLightWhite,
   //         height: 140,
   //         child: Column(
   //           children: [
   //             const Text('Do you want to exit from P Pay?'),
   //             const SizedBox(height: 10,),
   //             Image.asset('assets/loder/sad.gif',width: 95,height: 95,),
   //           ],
   //         ),
   //       ),
   //       actions:[
   //         ElevatedButton(
   //           onPressed: () => Navigator.of(context).pop(false),
   //           child:const Text('No'),
   //         ),
   //
   //         ElevatedButton(
   //           onPressed: () => SystemNavigator.pop(),
   //           child:const Text('Yes'),
   //         ),
   //
   //       ],
   //     ),
   //   ) ?? false;
   // }
   //




}
