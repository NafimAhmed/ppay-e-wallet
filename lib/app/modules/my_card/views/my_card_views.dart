import 'package:flutter/material.dart';

// import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/modules/my_card/controller/my_card_controller.dart';
import 'package:p_pay/app/routes/app_pages.dart';
import 'package:p_pay/app/util/app_color.dart';
import 'package:p_pay/app/util/app_size.dart';

// import 'package:p_pay/app/widgets/add_card_form.dart';
import 'package:p_pay/app/widgets/arrow_back_button.dart';
import 'package:p_pay/app/widgets/loder.dart';
// import 'package:p_pay/app/widgets/confirmation_card_template.dart';

import '../../../widgets/card_fomat.dart';
import '../../../widgets/submission_button.dart';
// import 'package:p_pay/app/widgets/submission_button.dart';

class MyCardViews extends GetView<MyCardController> {
  MyCardViews({super.key});

  final MyCardController controler = Get.put(MyCardController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
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
              SizedBox(
                height: screenHeight * 0.020,
              ),
              Obx(
                () => controler.isCardLoading.value == true
                    ? const Center(child: AppLoder())
                    : controller.userCardList.value.data!.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    controller.userCardList.value.data?.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.EDIT_CARD, arguments: {
                                        'card_number':
                                            '${controller.userCardList.value.data?[index].cardNumber}',
                                        'holder_name':
                                            '${controller.userCardList.value.data?[index].holderName}',
                                        'exp_date':
                                            '${controller.userCardList.value.data?[index].mmYy}',
                                        'card_id':'${controller.userCardList.value.data?[index].id}',
                                      });
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15.0),
                                      child: CardFormat(
                                        cardLastDigits: controler.userCardList
                                            .value.data![index].cardNumber
                                            .toString()
                                            .substring(
                                                controler
                                                        .userCardList
                                                        .value
                                                        .data![index]
                                                        .cardNumber
                                                        .length -
                                                    4,
                                                controler
                                                    .userCardList
                                                    .value
                                                    .data![index]
                                                    .cardNumber
                                                    .length),
                                        expiryDate: controler.userCardList.value
                                            .data![index].mmYy
                                            .toString(),
                                        balance: "0",
                                        currencySign: '\$',
                                        cardLogo:
                                            'https://p7.hiclipart.com/preview/314/877/264/credit-card-debit-card-mastercard-logo-visa-go-vector-thumbnail.jpg',
                                        color: Colors.deepPurple.shade900,
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : Expanded(
                            child: Container(
                            child: Center(
                                child: Text(
                              'No card is added',
                              style: GoogleFonts.poppins(
                                  fontSize: 28,
                                  color: AppColors.colorLightBlue),
                            )),
                          )),
              ),
              SubmissionButton(
                  textStyle: GoogleFonts.roboto(
                    color: const Color(0xFF1D3A6F),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  text: '+ Add new card',
                  onTap: () {
                    Get.toNamed(
                      Routes.ADD_CARD_FORM,
                    );
                    //Get.to(AddCardForm());
                  },
                  height: 60,
                  width: screenWidth * 0.8,
                  color: AppColors.colorLightWhite,
                  borderRadius: 10,
                  borderColor: AppColors.colorLightWhite)
            ],
          ),
        ),
      ),
    );
  }
}
