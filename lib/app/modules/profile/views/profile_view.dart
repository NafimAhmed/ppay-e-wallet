// import 'dart:io';

// import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:p_pay/app/modules/profile/providers/profile_provider.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:p_pay/app/util/app_local_stroge.dart';
import 'package:p_pay/app/widgets/profile_tile.dart';

import '../../../routes/app_pages.dart';
import '../../../util/app_constant.dart';
import '../../../util/app_size.dart';
import '../../../widgets/arrow_back_button.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);

  final ProfileController homeController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ArrowBackButton(),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.095),
                    child: Text(
                      "Profile",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700, fontSize: 22),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              InkWell(
                onTap: (){
                  homeController.getImageData();

                },
                child: Stack(
                  children: [
                    ClipOval(
                      child:  Obx(() =>
                          homeController.profilepicLoader.value == true ?
                              const CircularProgressIndicator() :
                          FadeInImage(
                            image: NetworkImage(
                              '$IMAGE_BASE_URL${getStorage.read('profile_picture').toString()}',),
                            placeholder: const AssetImage(
                             kAppProfilelImg,
                            ),
                            fit: BoxFit.cover,
                            height: 80,
                            width: 80,
                            imageErrorBuilder: (context,
                                error, stackTrace) {
                              return Image.asset(
                                kAppProfilelImg,
                                fit: BoxFit.cover,
                                height: 80,
                                width: 80,
                              );
                            },
                          )
                    
                       )
                    ),
                    const Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(Icons.camera_alt, color: Colors.blue,)),
                  ],
                ),
              ),
              Text(
                getStorage.read("first_name").toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: const Color(0xFF1D3A6F),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                getStorage.read("email").toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: const Color(0xFF6B7280),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              ProfileTile(
                image: const Icon(
                  Icons.person_outline,
                  color: Color(0xFF203C71),
                ),
                onTap: () {
                  Get.toNamed(Routes.ACCOUNT_INFO);
                },
                title: 'Account Info',
              ),
              ProfileTile(
                image: const Icon(
                  Icons.group,
                  color: Color(0xFF1DAB87),
                ),
                onTap: () {
                  Get.toNamed(Routes.CONTACT);
                },
                title: 'Contact List',
              ),
              ProfileTile(
                image: const Icon(
                  Icons.g_translate,
                  color: Color(0xFF7B61FF),
                ),
                onTap: () {
                  Get.toNamed(Routes.SELECT_LANGUAGE);
                },
                title: 'Language',
              ),
              ProfileTile(
                image: const Icon(
                  Icons.settings,
                  color: Color(0xFF5FA8EE),
                ),
                onTap: () {
                  Get.toNamed(Routes.GENERAL_SETTINGS);
                },
                title: 'General Setting',
              ),
              ProfileTile(
                image: const Icon(
                  Icons.lock,
                  color: Color(0xFFFFB9AA),
                ),
                onTap: () {
                  Get.toNamed(Routes.PASSWORD_RESET);
                },
                title: 'Change Password',
              ),
              ProfileTile(
                image: const Icon(
                  Icons.question_mark,
                  color: Color(0xFF55BBC5),
                ),
                onTap: () {
                  Get.toNamed(Routes.FAQS);
                },
                title: 'FAQs',
              ),
              ProfileTile(
                image: const Icon(
                  Icons.star_border_outlined,
                  color: Color(0xFFFACC15),
                ),
                onTap: () {},
                title: 'Rate Us',
              ),
              ProfileTile(
                image: const Icon(
                  Icons.logout_rounded,
                  color: Color(0xFF5FA8EE),
                ),
                onTap: () {
                  homeController.checkLogout();
                },
                title: 'Log out',
              ),
            ],
          )),
        ),
      ),
    );
  }
}
