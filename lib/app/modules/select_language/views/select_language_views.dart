import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/modules/select_language/controller/select_language_controller.dart';

import '../../../util/app_color.dart';
import '../../../util/app_local_stroge.dart';
import '../../../util/country_list.dart';

class SelectLanguageViews extends GetView<SelectLanguageController> {
  const SelectLanguageViews({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // List<String> languageList = [
    //   '🇧🇩 Bangla',
    //   '🇬🇧 english',
    //   '🇮🇳 hindi',
    //   '🇪🇦 spanish',
    //   '🇨🇵 French',
    //   '🇨🇳 chinese',
    //   '🇩🇪 German',
    //   '🇵🇰 urdu',
    //   '🇯🇵 Japanes',
    //   '🇹🇷 Turkey',
    //   '🇸🇦 Arabic',
    //   '🇦🇫 South africa',
    //   '🇰🇷 Korea',
    //   '🇱🇰 Sri Lanka'
    // ];


    // if(getStorage.read('language')!=null){
    //   groupValue.value=getStorage.read('language').toString();
    // }

    //RxString groupValue = CountryList.languageList.first.obs;

    //languageList.first.obs;

    Get.snackbar("test", '${getStorage.read('language')}');

    print('test---------------------------------------${getStorage.read('language')}');

    return Scaffold(
      appBar: AppBar(title: const Text('Select Language'),),
      body: SingleChildScrollView(
        child: Column(
          children: [



            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.colorGreyLight,
              ),
              child: TextFormField(
                //obscureText: false,
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
                },

                // controller: textEditingController,
              ),
            ),




            ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: CountryList.languageList.length,
                itemBuilder: (context, index) {
                  return Obx(() => RadioListTile(
                      title: Text(CountryList.languageList[index]),
                      value: CountryList.languageList[index],
                      groupValue: controller.groupValue.value,
                      onChanged: (value) async {
                        controller.groupValue.value = '$value';
                        await getStorage.write('language', controller.groupValue.value);
                      }));
                })
          ],
        ),
      ),
    );
  }
}
