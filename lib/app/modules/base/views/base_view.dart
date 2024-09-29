
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/modules/my_card/views/my_card_views.dart';

import '../../../util/app_color.dart';
import '../../../util/app_constant.dart';
import '../../../util/app_size.dart';
import 'qr_scanner.dart';
import '../../activity/views/activity_view.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
// import '../controllers/base_controller.dart';

class BaseView extends StatefulWidget{


   const BaseView({Key? key}) : super(key: key);

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  var currentIndex = 0;

  final screens = [
     HomeView(),
     MyCardViews(),
    const QrScanner(),
     ActivityView(),
     ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(
        // canPop: true,
        onWillPop: () => showExitPopup(),
        // {
        //   //debugPrint("pop value"+didPop.toString());
        //      //if(didPop){
        //        showExitPopup();
        //      //}
        // },
        child: Scaffold(
        bottomNavigationBar: Container(
          height: Platform.isIOS ? screenHeight * 0.10 : screenHeight * 0.08,
          decoration: const BoxDecoration(
            color: AppColors.colorLightWhite,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                child: Container(
                  width: screenWidth * 0.20,
                  height: screenHeight * 0.08,
                  decoration: const BoxDecoration(
                    color: AppColors.colorLightWhite,
                  ),
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          kHomeIcon,
                          height: screenHeight * 0.030,
                          width: screenWidth * 0.020,
                          color: currentIndex == 0 ? AppColors.colorDeepBlue : AppColors.colorLightGrey,
                        ),
                      ),
                      Text("Home",style: GoogleFonts.poppins(
                        color: currentIndex == 0 ? AppColors.colorDeepBlue : AppColors.colorLightGrey,
                      ),)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                child: Container(
                  width: screenWidth * 0.20,
                  height: screenHeight * 0.08,
                  decoration: const BoxDecoration(
                    color: AppColors.colorLightWhite,
                  ),
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          kCardIcon,
                          height: screenHeight * 0.023,
                          width: screenWidth * 0.020,
                           color: currentIndex == 1 ? AppColors.colorDeepBlue : AppColors.colorLightGrey,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.005,),
                      Text("My Card",style: GoogleFonts.poppins(
                        color: currentIndex == 1 ? AppColors.colorDeepBlue : AppColors.colorLightGrey,
                      ),)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
                child: Container(
                  width: screenWidth * 0.20,
                  height: screenHeight * 0.07,
                  decoration: const BoxDecoration(
                    color: AppColors.colorLightBlue,
                    shape: BoxShape.circle
                  ),
                  child:
                  Center(
                    child: SvgPicture.asset(
                      kScanIcon,
                      height: screenHeight * 0.035,
                      width: screenWidth * 0.025,
                    ),
                  ),
                  // ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                child: Container(
                  width: screenWidth * 0.20,
                  height: screenHeight * 0.08,
                  decoration: const BoxDecoration(
                    color: AppColors.colorLightWhite,
                  ),
                  child:

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding:  EdgeInsets.only(bottom: screenHeight * 0.005),
                          child: SvgPicture.asset(
                            kActivityIcon,
                            height: screenHeight * 0.030,
                            width: screenWidth * 0.020,
                            color: currentIndex == 3 ? AppColors.colorDeepBlue : AppColors.colorLightGrey,
                          ),
                        ),
                      ),
                      Text("Activity",style: GoogleFonts.poppins(
                        color: currentIndex == 3 ? AppColors.colorDeepBlue : AppColors.colorLightGrey,
                      ),)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 4;
                  });
                },
                child: Container(
                  width: screenWidth * 0.20,
                  height: screenHeight * 0.08,
                  decoration: const BoxDecoration(
                    color: AppColors.colorLightWhite,
                  ),
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          kProfileIcon,
                          height: screenHeight * 0.030,
                          width: screenWidth * 0.025,
                          color:  currentIndex == 4 ? AppColors.colorDeepBlue : AppColors.colorLightGrey,
                        ),
                      ),
                      Text("Profile",style: GoogleFonts.poppins(
                        color:  currentIndex == 4 ? AppColors.colorDeepBlue : AppColors.colorLightGrey,
                      ),)

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        body: screens[currentIndex],
            ),
      );
  }

     showExitPopup()  async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit P Pay'),
        content: Container(
          color: AppColors.colorLightWhite,
          height: 140,
          child: Column(
            children: [
              const Text('Do you want to exit from P Pay?'),
              const SizedBox(height: 10,),
              Image.asset('assets/loder/sad.gif',width: 95,height: 95,),
            ],
          ),
        ),
        actions:[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child:const Text('No'),
          ),

          ElevatedButton(
            onPressed: () => SystemNavigator.pop(),
            child:const Text('Yes'),
          ),

        ],
      ),
    ) ?? false;
  }

}
