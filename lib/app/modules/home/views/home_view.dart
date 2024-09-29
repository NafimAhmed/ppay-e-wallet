import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/modules/stripe_test.dart';
import 'package:p_pay/app/util/app_color.dart';
import 'package:p_pay/app/util/app_constant.dart';
import 'package:p_pay/app/util/app_size.dart';
import 'package:p_pay/app/widgets/card_fomat.dart';
import 'package:p_pay/app/widgets/loder.dart';
import 'package:p_pay/app/widgets/roundIconButton.dart';
import 'package:p_pay/app/widgets/transection_tile.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../../routes/app_pages.dart';
import '../../../util/transection_search.dart';
import '../../../widgets/box_text_field.dart';
import '../../my_card/controller/my_card_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());



  final MyCardController myCardController = Get.put(MyCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF4F5FA),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 67,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Current Balance',
                      style: GoogleFonts.poppins(
                        color: AppColors.colorLightGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      currentBalance.toString(),
                      style: GoogleFonts.roboto(
                        color: AppColors.colorLightBlue,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        height: 0.02,
                        letterSpacing: 0.11,
                      ),
                    )
                  ],
                ),


                InkWell(
                  onTap:(){
                    Get.toNamed(Routes.NOTIFICATION);
                  },
                  child: const Icon(Icons.notifications_none),
                )
              ],
            )
          // centerTitle: true,
        ),




        body: SlidingUpPanel(

          maxHeight: screenHeight,
          minHeight: screenHeight*0.35,
          color:  Color(0xFFF4F5FA),
          boxShadow: [BoxShadow(blurRadius: 0,color: Color(0xFFF4F5FA),)],

          body: Container(


            child: Column(
              children: [
                SizedBox(
                  height: 168,
                  child: Obx(() =>
                  myCardController.isCardLoading.value == true ?
                  const AppLoder() :
                  myCardController.userCardList.value.data!.isNotEmpty?
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: myCardController.userCardList.value.data?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CardFormat(
                        cardLastDigits: myCardController.userCardList.value.data![index].cardNumber.toString().substring(myCardController.userCardList.value.data![index].cardNumber.length-4,myCardController.userCardList.value.data![index].cardNumber.length),//controller.userCardList.value.data![index].cardNumber.toString().substring(0,4),
                        expiryDate: myCardController.userCardList.value.data![index].mmYy.toString(),//'02/28',
                        balance: '0',
                        currencySign: '\$',
                        cardLogo:
                        'https://p7.hiclipart.com/preview/314/877/264/credit-card-debit-card-mastercard-logo-visa-go-vector-thumbnail.jpg',
                        color: Colors.deepPurple.shade900,
                      );
                    },
                  ):
                  InkWell(
                    onTap: (){
                      Get.toNamed(Routes.ADD_CARD_FORM);
                    },
                    child: Container(
                      width: screenWidth -20,
                      height: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.all(20),
                      decoration: ShapeDecoration(
                        color: Color(0xFF3862F8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child:  Center(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('No card is added',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                          Text('+ Tap to add Card',
                            style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                        ],
                      )),
                    ),
                  )
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const RoundedIconButton(
                        text: 'Request',
                        icon: Icon(Icons.mail_outline_outlined),
                      ),
                      InkWell(
                        onTap: () {
                          //Get.toNamed(Routes.PAYMENT);
                          Get.toNamed(Routes.MY_QR_CODE);
                        },
                        child: const RoundedIconButton(
                          text: 'QR Code',
                          icon: Icon(Icons.qr_code_2,size: 30,),
                        ),
                      ),
                      InkWell(

                        onTap: () {
                          // Get.toNamed(Routes.SEND_MONEY);

                          Get.toNamed(Routes.SEND_MONEY_FORM);

                        },
                        child: const RoundedIconButton(
                          text: 'Send',
                          icon: Icon(Icons.send),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(StripeTest());
                        },
                        child: const RoundedIconButton(
                          text: 'More',
                          icon: Icon(Icons.border_all),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),





              ],
            ),
          ),

          panel: Container(

            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.0),
                    topLeft: Radius.circular(25.0)

                ),
                color: Colors.white
            ),
            // decoration: const BoxDecoration(
            //     color: AppColors.colorLightWhite,
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(35.0),
            //       topRight: Radius.circular(35.0),
            //     )),
            child: Container(

              child: Column(
                children: [

                  const Divider(thickness:5 ,indent: 130,endIndent: 130,),






                  // ExpansionTile(
                  //
                  //   title:  Container(
                  //   margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  //   child: Text(
                  //     'Recent Transactions',
                  //     style: GoogleFonts.poppins(
                  //       color: const Color(0xFF060F27),
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //     ),
                  //   ),
                  // ),
                  //
                  //   trailing: Icon(
                  //     Icons.search,
                  //     color: Colors.green,
                  //   ),
                  //
                  //   children: [
                  //     BoxTextField(
                  //       textEditingController: controller.searchController,
                  //         //textEditingController: SendMoneyFormController.receiverEmailController,
                  //         labelName: 'Search Transection',
                  //         //controller: receiverSigningController,
                  //     ),
                  //   ],
                  //
                  //
                  //
                  // ),

                  TransectionSearch(title: 'Recent Transactions', textEditingController: controller.searchController, icon: Icon(Icons.search),),








                  Expanded(
                    child: 
                      Obx(() => controller.isTransactionLoading.value == true ?
                       ListView.builder(
                           itemCount: 1,
                           itemBuilder: (index,context){
                        return  const Center(child: AppLoder());
                      }) :  ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: controller.userTransactionList.value.data!.length,
                          itemBuilder: (context, index) {
                            return  TransectionTile(
                              title: controller.userTransactionList.value.data![index].receiverUser.firstName.toString(),
                              subtitle:  controller.userTransactionList.value.data![index].transactionType.toString(),
                              amount: '-\$ ${controller.userTransactionList.value.data![index].transactionAmount.toString()}',
                              imageLink:
                              'https://variety.com/wp-content/uploads/2019/02/netflix-logo-originals.jpg?w=640',
                              amountColor: Colors.red,
                            );
                          }),)
                  ),



                  const SizedBox(height: 168,)


                ],
              ),
            ),
          ),
        ),
    );
  }
}
