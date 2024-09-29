



import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/modules/card_adding_form/controller/card_adding_controller.dart';
import 'package:p_pay/app/widgets/submission_button.dart';

// import '../../../routes/app_pages.dart';
import '../../../util/app_color.dart';
import '../../../util/app_size.dart';
import '../../../widgets/app_snackbar.dart';
import '../../../widgets/loder.dart';
import '../../my_card/controller/my_card_controller.dart';
// import '../../my_card/views/my_card_views.dart';

class CardAddingFormView extends GetView<CardAddingController>{
   CardAddingFormView({super.key});

  final MyCardController myCardController = Get.put(MyCardController());

  @override
  Widget build(BuildContext context) {

    // final FocusNode focusNode = FocusNode();
    TextEditingController ccvCont=TextEditingController();
    TextEditingController expdateCont =TextEditingController();

    // focusNode.addListener(() {
    //
    // });
    // TODO: implement build
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Add Card'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child:
          Stack(
            children: [
              Column(
                children: [

                  Obx(() =>  CreditCardWidget(
                    enableFloatingCard: true,
                    cardNumber: controller.crdNumber.value,
                    expiryDate: controller.expDate.value,
                    cardHolderName: controller.holderName.value,
                    cvvCode: controller.cvvNumber.value.toString(),
                    bankName: ' ',
                    frontCardBorder: //useGlassMorphism ? null :
                    Border.all(color: Colors.grey),
                    backCardBorder: //useGlassMorphism ? null :
                    Border.all(color: Colors.grey),
                    showBackView: controller.isCardTurn.value,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    isHolderNameVisible: true,
                    cardBgColor: AppColors.colorLightBlue,
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
                  ),
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
                            controller.isCardTurn.value = false;
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

                            controller.crdNumber.value =value!;

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
                            controller.isCardTurn.value=false;
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

                            controller.holderName.value=value!;

                          },

                          // controller: textEditingController,
                        ),
                      )
                    //BoxTextField(textEditingController: cardNumbCont, labelName: '4321 / 2311 / 3423 / 3423', controller: controller,),
                  ),

                  SizedBox(
                    height: screenHeight * 0.020,
                  ),

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
                                                controller: expdateCont,
                                                keyboardType: TextInputType.number,




                                                onTap: (){
                                                  controller.isCardTurn.value = false;
                                                },
                                                onChanged: (String? value) {
                                                  //textEditingController.text = value!;



                                                  controller.expDate.value=value!;

                                                  if(expdateCont.text.length==2){
                                                    expdateCont.text='${expdateCont.text}/';
                                                    controller.expDate.value='${controller.expDate.value}/';
                                                  }else if(expdateCont.text.endsWith('/')){
                                                    expdateCont.clear();
                                                    controller.expDate.value='';

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
                                                    controller.isCardTurn.value=true;
                                                  },

                                                  keyboardType: TextInputType.number,
                                                  onChanged: (String? value) {
                                                    //textEditingController.text = value!;
                                                    controller.cvvNumber.value= value!;
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

                  SubmissionButton(text: 'Add Card', onTap: () async {

                    if(controller.holderName.value==''){
                      showSnackBar('Caution', 'Enter Card holder name', Colors.red, SnackPosition.BOTTOM);
                    }
                    else if(controller.crdNumber.value.isEmpty){
                      showSnackBar('Caution', 'Enter Card number', Colors.red, SnackPosition.BOTTOM);
                    }
                    else if(controller.cvvNumber.value.toString().isEmpty){showSnackBar('Caution', 'Enter CVV Number', Colors.red, SnackPosition.BOTTOM);}
                    else if(controller.expDate.value.isEmpty){
                      showSnackBar('Caution', 'Enter Card expiry date', Colors.red, SnackPosition.BOTTOM);
                    }
                    else{
                      await controller.saveUserCreditOrDebitCard();
                      await myCardController.getUserCardList();
                      Navigator.pop(context);
                      // Get.to(
                      //     () => MyCardViews()
                      // );
                    }
                  }, height: 50, width: screenWidth*0.8, color: AppColors.colorLightBlue, borderRadius: 10, borderColor: AppColors.colorLightBlue),
                ],
              ),
              Obx(() =>  controller.isAddCardLoading.value == true ?  const Center(
                child:  AppLoder(),
              ) : Container() )
            ],
          )
      ),

    );
  }

}