import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../util/app_color.dart';
import '../../../util/app_size.dart';
import '../../../widgets/loder.dart';
import '../controller/faq_controller.dart';

class FAQListViews extends GetView<FAQController> {
  const FAQListViews({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs'),
        centerTitle: true,
      ),
      body: Column(
        children: [
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
          ),)

        ],
      ),
    );
  }
}