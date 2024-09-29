import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_pay/app/util/app_size.dart';

class PrimarCarousel extends StatelessWidget {
  final List<Widget> itemList;
  final double height;
  final Color dotColor;


  const PrimarCarousel(
      {super.key,
      required this.itemList,
      required this.height, required this.dotColor});

  @override
  Widget build(BuildContext context) {
    RxInt currentPage = 0.obs;
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            // height: screenHeight / 2 + 70,
            aspectRatio: screenWidth / (screenHeight * 0.490),
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            //onPageChanged:BorderRadiusDirectional.circular(12.0),
            scrollDirection: Axis.horizontal,
            onPageChanged: (index,reason){
              currentPage.value=index;
            }
          ),
          items: itemList,
        ),

        Obx(() => Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: DotsIndicator(
            dotsCount: itemList.length,
            position: currentPage.value,
            decorator: DotsDecorator(
              color: Colors.grey, // Inactive color
              activeColor: dotColor,
            ),
          ),
        ))




      ],
    );
  }
}
