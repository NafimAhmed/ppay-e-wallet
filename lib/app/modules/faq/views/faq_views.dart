import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/modules/faq/controller/faq_controller.dart';
// import 'package:p_pay/app/modules/signin/controllers/signin_controller.dart';
import 'package:p_pay/app/util/app_color.dart';
import 'package:p_pay/app/util/app_size.dart';
import 'package:p_pay/app/widgets/loder.dart';
// import 'package:p_pay/app/widgets/box_text_field.dart';
// import 'package:p_pay/app/widgets/submission_button.dart';

import 'faq_list_view.dart';

class FAQViews extends GetView<FAQController> {


  const FAQViews({super.key});



  @override
  Widget build(BuildContext context) {
    controller.getUserFAQ();
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child:  Text(
              'You have any question ?',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: AppColors.colorDeepBlue,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.colorGreyLight,
            ),
            child: TextFormField(
              cursorColor: AppColors.colorBlack,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintStyle: GoogleFonts.poppins(
                  color: AppColors.colorBlack.withOpacity(0.5),
                ),
                hintText: 'Search',
                border: InputBorder.none,
              ),
              onChanged: (String? value) {
                //textEditingController.text = value!;
                controller.searchValue.value = value.toString();
                controller.getUserSearchFAQList();
              },

              // controller: textEditingController,
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Frequently Asked',
                  style: GoogleFonts.roboto(
                    color: AppColors.colorDeepBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(
                            () => const FAQListViews()
                    );
                    controller.searchValue.value = "";
                  },
                  child: Text(
                    'View All',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.roboto(
                      color: AppColors.colorBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),


          Obx(() =>  controller.isFAQLoading.value ==  true ?
          const Center(child:  AppLoder()) :


          controller.searchValue.value == "" ?
          Expanded(
            child: Container(
              height: screenHeight,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.userFaq.value.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title:  Text(
                        controller.userFaq.value.data![index].title.toString(),
                        style: GoogleFonts.roboto(
                          color: AppColors.colorDeepBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          controller.userFaq.value.data![index].description.toString(),
                          style: GoogleFonts.roboto(
                            color: AppColors.colorLightGrey,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          )

              :

          Expanded(
            child: Container(
              height: screenHeight,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.userSearchFaqList.value.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title:  Text(
                        controller.userSearchFaqList.value.data![index].title.toString(),
                        style: GoogleFonts.roboto(
                          color: AppColors.colorDeepBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          controller.userSearchFaqList.value.data![index].description.toString(),
                          style: GoogleFonts.roboto(
                            color: AppColors.colorLightGrey,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),

          )

        ],
      ),
    );
  }
}
