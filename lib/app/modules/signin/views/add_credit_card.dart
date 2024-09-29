


import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:p_pay/app/modules/profile/controllers/profile_controller.dart';
import 'package:p_pay/app/modules/signin/controllers/signin_controller.dart';
import 'package:p_pay/app/util/app_color.dart';
import 'package:p_pay/app/util/app_size.dart';
import 'package:p_pay/app/widgets/app_snackbar.dart';
// import 'package:p_pay/app/widgets/box_text_field.dart';
// import 'package:p_pay/app/widgets/card_fomat.dart';
import 'package:p_pay/app/widgets/submission_button.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/arrow_back_button.dart';
import '../../../widgets/indicator_line.dart';

class AddCard extends GetView<SigninController>  {
   AddCard({super.key});

  @override
  SigninController controler = Get.put(SigninController());

  @override
  Widget build(BuildContext context) {


    TextEditingController ccvCont=TextEditingController();
    TextEditingController expdateCont=TextEditingController();

    // SigninController controller = Get.put(SigninController());

    RxString holderName=''.obs;
    RxString crdNumber=''.obs;
    RxString cvvNumber=''.obs;
    RxString expDate=''.obs;
    RxBool turn=false.obs;


    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.020,
                  left: screenWidth * 0.040),
              child: const ArrowBackButton(),
            ),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            const IndicatorLine(percent: 0.8528,),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.040),
              child: Text(
                'Link a debit or credit card',
                style: GoogleFonts.poppins(
                    color: AppColors.colorBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.027
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.010,
            ),


            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.040),
              child: Text(
                "Send fund or shop with ease",
                style: GoogleFonts.poppins(
                    color: AppColors.colorBlack,
                    fontSize: screenHeight * 0.017
                ),
              ),
            ),








            Obx(() =>  CreditCardWidget(
              enableFloatingCard: true,
              //glassmorphismConfig:  Glassmorphism(blurX: 0.0, blurY: 0.0, gradient: gradient,),
              //: Glassmorphism.defaultConfig();//_getGlassmorphismConfig(),
              cardNumber: crdNumber.value,
              expiryDate: expDate.value,
              cardHolderName: holderName.value,
              cvvCode: cvvNumber.value,
              bankName: ' ',
              frontCardBorder: //useGlassMorphism ? null :
              Border.all(color: Colors.grey),
              backCardBorder: //useGlassMorphism ? null :
              Border.all(color: Colors.grey),
              showBackView: turn.value,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              cardBgColor: AppColors.colorLightBlue,

              //backgroundImage: null,//useBackgroundImage ? 'assets/card_bg.png' : null,
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange:
                  (CreditCardBrand creditCardBrand) {},
              customCardTypeIcons: <CustomCardTypeIcon>[
                CustomCardTypeIcon(
                  cardType: CardType.mastercard,
                  cardImage: Image.network(
                    'https://p7.hiclipart.com/preview/314/877/264/credit-card-debit-card-mastercard-logo-visa-go-vector-thumbnail.jpg',
                    height: 48,
                    width: 48,
                  ),
                ),
              ],
            )),



            SizedBox(
              height: screenHeight * 0.020,
            ),

            Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                child: Container(

                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.colorGreyLight,
                  ),



                  child: TextFormField(
                    onTap: (){
                      turn.value=false;
                    },
                    keyboardType: TextInputType.number,
                    //obscureText: false,
                    cursorColor: AppColors.colorBlack,
                    maxLength: 19,
                    decoration: InputDecoration(
                      counterText: '',
                      // prefixIcon: Icon(Icons.search),

                      hintStyle: GoogleFonts.poppins(
                        color: AppColors.colorBlack.withOpacity(0.5),
                      ),
                      hintText: 'card number',





                      border: InputBorder.none,
                    ),
                    onChanged: (String? value) {
                      //textEditingController.text = value!;

                      crdNumber.value=value!;

                    },

                    // controller: textEditingController,
                  ),
                )

              // BoxTextField(
              //   textEditingController: cardHolderCont, labelName: 'Shanto Shah', controller: controller,
              // ),
            ),


            SizedBox(
              height: screenHeight * 0.020,
            ),


            Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                child: Container(


                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.colorGreyLight,
                  ),



                  child: TextFormField(
                    onTap: (){
                      turn.value=false;
                    },
                    //obscureText: false,
                    cursorColor: AppColors.colorBlack,
                    decoration: InputDecoration(

                      // prefixIcon: Icon(Icons.search),









                      hintStyle: GoogleFonts.poppins(
                        color: AppColors.colorBlack.withOpacity(0.5),
                      ),
                      hintText: 'card holder name',





                      border: InputBorder.none,
                    ),
                    onChanged: (String? value) {
                      //textEditingController.text = value!;

                      holderName.value=value!;

                    },

                    // controller: textEditingController,
                  ),
                )


              //BoxTextField(textEditingController: cardNumbCont, labelName: '4321 / 2311 / 3423 / 3423', controller: controller,),
            ),

            // SizedBox(
            //   height: screenHeight * 0.020,
            // ),
            //
            //
            // Padding(
            //   padding:  const EdgeInsets.only(left: 15.0,right: 15.0),
            //   child: BoxDropdown(menuItem: ['NID','Passport','Birth certificate'], hintText: 'Document Type'),
            // ),

            SizedBox(
              height: screenHeight * 0.020,
            ),

            // Padding(
            //   padding: const EdgeInsets.only(left: 15.0,right: 15.0),
            //   child: BoxTextField(
            //     textEditingController: controller.emailController, labelName: 'Postcode', controller: controller,
            //   ),
            // ),
            //
            //
            // SizedBox(height: screenHeight * 0.020,),


            Container(
              padding: const EdgeInsets.only(left: 15.0,right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  SizedBox(
                    width: 153,
                    height: 81,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Month/Year',
                          style: TextStyle(
                            color: Color(0xFF2D2F2F),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Container(
                          width: 153,
                          height: 56,
                          padding: const EdgeInsets.all(16),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFEBEDF6),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height:18,
                                        // padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                        alignment: Alignment.center,

                                        width: 30,
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: expdateCont,





                                          onTap: (){
                                            turn.value=false;
                                          },
                                          onChanged: (String? value) {
                                            //textEditingController.text = value!;



                                            expDate.value=value!;


                                            print('the key value is -----------------$value');

                                            if(value.length==2){
                                              expdateCont.text='${expdateCont.text}/';
                                              expDate.value='${expDate.value}/';
                                            }
                                            else if(expdateCont.text.endsWith('/')){
                                              expdateCont.clear();
                                              expDate.value='';

                                            }

                                          },



                                          maxLength: 5,
                                          decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              isCollapsed: true,
                                              isDense: true,
                                              counterText: '',
                                              hintText: 'MM/YY'

                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),





                  SizedBox(
                    width: 153,
                    height: 81,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'CVV',
                          style: TextStyle(
                            color: Color(0xFF2D2F2F),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Container(
                          width: 153,
                          height: 56,
                          padding: const EdgeInsets.all(16),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFEBEDF6),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 18,
                                        child: SizedBox(

                                          height: 50,
                                          width: screenWidth*0.4,

                                          child: TextFormField(



                                            onTap: (){
                                              turn.value=true;
                                            },

                                            keyboardType: TextInputType.number,
                                            onChanged: (String? value) {
                                              //textEditingController.text = value!;

                                              cvvNumber.value=value!;

                                            },
                                            controller: ccvCont,

                                            maxLength: 3,
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              isCollapsed: true,
                                              isDense: true,
                                              counterText: '',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )




                ],
              ),
            ),


            const SizedBox(height: 20,),












            // SizedBox(height: 10,),
      //
      //
      // CardFormat(
      //         cardLastDigits: '2236',
      //         expiryDate: '02/24',
      //         balance: '5300.00',
      //         currencySign: '\$',
      //         cardLogo:
      //             'https://p7.hiclipart.com/preview/314/877/264/credit-card-debit-card-mastercard-logo-visa-go-vector-thumbnail.jpg',
      //         color: AppColors.colorLightBlue,
      //       ),
      //
      //
      //
      //
      //
      //       // SizedBox(
      //       //   height: screenHeight * 0.020,
      //       // ),
      //
      //
      //       // Padding(
      //       //   padding:  const EdgeInsets.only(left: 15.0,right: 15.0),
      //       //   child: BoxDropdown(menuItem: ['Malean','Bangladeshi','British','Scotish'], hintText: 'Nationality'),
      //       // ),
      //
      //
      //
      //
      //
      //
      //
      //       SizedBox(
      //         height: screenHeight * 0.020,
      //       ),
      //
      //       Padding(
      //         padding: const EdgeInsets.only(left: 15.0,right: 15.0),
      //         child: BoxTextField(
      //           textEditingController: controller.emailController, labelName: 'Shanto Shah', controller: controller,
      //         ),
      //       ),
      //
      //
      //       SizedBox(
      //         height: screenHeight * 0.020,
      //       ),
      //
      //
      //       Padding(
      //         padding: const EdgeInsets.only(left: 15.0,right: 15.0),
      //         child: BoxTextField(
      //           textEditingController: controller.emailController, labelName: '4321 / 2311 / 3423 / 3423', controller: controller,
      //         ),
      //       ),
      //
      //       // SizedBox(
      //       //   height: screenHeight * 0.020,
      //       // ),
      //       //
      //       //
      //       // Padding(
      //       //   padding:  const EdgeInsets.only(left: 15.0,right: 15.0),
      //       //   child: BoxDropdown(menuItem: ['NID','Passport','Birth certificate'], hintText: 'Document Type'),
      //       // ),
      //
      //       SizedBox(
      //         height: screenHeight * 0.020,
      //       ),
      //
      //       Padding(
      //         padding: const EdgeInsets.only(left: 15.0,right: 15.0),
      //         child: BoxTextField(
      //           textEditingController: controller.emailController, labelName: 'Postcode', controller: controller,
      //         ),
      //       ),
      //
      //
      //       SizedBox(height: screenHeight * 0.020,),
      //
      //
      //       Container(
      //         padding: const EdgeInsets.only(left: 15.0,right: 15.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //
      //
      //             Container(
      //               width: 153,
      //               height: 81,
      //               child: Column(
      //                 mainAxisSize: MainAxisSize.min,
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     'Month/Year',
      //                     style: TextStyle(
      //                       color: Color(0xFF2D2F2F),
      //                       fontSize: 14,
      //                       fontFamily: 'Poppins',
      //                       fontWeight: FontWeight.w400,
      //                       height: 0,
      //                     ),
      //                   ),
      //                   SizedBox(height: 5,),
      //                   Container(
      //                     width: 153,
      //                     height: 56,
      //                     padding: const EdgeInsets.all(16),
      //                     decoration: ShapeDecoration(
      //                       color: Color(0xFFEBEDF6),
      //                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      //                     ),
      //                     child: Column(
      //                       mainAxisSize: MainAxisSize.min,
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Container(
      //                           width: double.infinity,
      //                           child: Row(
      //                             mainAxisSize: MainAxisSize.min,
      //                             mainAxisAlignment: MainAxisAlignment.start,
      //                             crossAxisAlignment: CrossAxisAlignment.center,
      //                             children: [
      //                               Expanded(
      //                                 child: Container(
      //                                   height:18,
      //                                  // padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
      //                                   alignment: Alignment.center,
      //                                     child: TextFormField(
      //                                       maxLength: 5,
      //                                       decoration: InputDecoration(
      //                                         border: InputBorder.none,
      //                                         isCollapsed: true,
      //                                         isDense: true
      //                                       ),
      //                                     ),
      //
      //                                   width: 30,
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //
      //
      //
      //
      //
      //             Container(
      //               width: 153,
      //               height: 81,
      //               child: Column(
      //                 mainAxisSize: MainAxisSize.min,
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     'CVV',
      //                     style: TextStyle(
      //                       color: Color(0xFF2D2F2F),
      //                       fontSize: 14,
      //                       fontFamily: 'Poppins',
      //                       fontWeight: FontWeight.w400,
      //                       height: 0,
      //                     ),
      //                   ),
      //                   SizedBox(height: 5,),
      //                   Container(
      //                     width: 153,
      //                     height: 56,
      //                     padding: const EdgeInsets.all(16),
      //                     decoration: ShapeDecoration(
      //                       color: Color(0xFFEBEDF6),
      //                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      //                     ),
      //                     child: Column(
      //                       mainAxisSize: MainAxisSize.min,
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Container(
      //                           width: double.infinity,
      //                           child: Row(
      //                             mainAxisSize: MainAxisSize.min,
      //                             mainAxisAlignment: MainAxisAlignment.start,
      //                             crossAxisAlignment: CrossAxisAlignment.center,
      //                             children: [
      //                               Expanded(
      //                                 child: Container(
      //                                   height: 18,
      //                                   child: Container(
      //
      //                                     child: TextFormField(
      //                                       maxLength: 3,
      //                                       decoration: InputDecoration(
      //                                         border: InputBorder.none,
      //                                         isCollapsed: true,
      //                                         isDense: true,
      //                                       ),
      //                                     ),
      //                                   height: 50,
      //                                     width: screenWidth*0.4,
      //                                   ),
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             )
      //
      //
      //
      //
      //           ],
      //         ),
      //       ),
      //
      //
      //






            SizedBox(
              height: screenHeight * 0.070,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35.0,right: 35.0),
              child: SubmissionButton(
                text: 'Add Card',
                onTap: () {


                  if(holderName.value==''){
                    showSnackBar('Caution', 'Enter Card holder name', Colors.red, SnackPosition.BOTTOM);
                  }
                  else if(crdNumber.value.isEmpty){
                    showSnackBar('Caution', 'Enter Card number', Colors.red, SnackPosition.BOTTOM);
                  }
                  else if(cvvNumber.value.isEmpty){showSnackBar('Caution', 'Enter CVV Number', Colors.red, SnackPosition.BOTTOM);}
                  else if(expDate.value.isEmpty){
                    showSnackBar('Caution', 'Enter Card expiry date', Colors.red, SnackPosition.BOTTOM);
                  }
                  else{
                    Get.toNamed(Routes.BASE);
                  }



                  // Get.to(
                  //         () => AddCard()
                  // );
                },
                height: screenHeight * 0.075,
                width: screenWidth,
                color: AppColors.colorLightBlue,
                borderRadius: 5.0,
                textStyle: GoogleFonts.manrope(
                    fontSize: screenHeight * 0.020,
                    fontWeight: FontWeight.bold
                ),
                borderColor: AppColors.colorBlue,
              ),
            ),


            SizedBox(height: screenHeight * 0.020,),

          ],
        ),
      ),
    ));
  }
}













