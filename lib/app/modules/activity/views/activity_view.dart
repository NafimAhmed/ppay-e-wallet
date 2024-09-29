import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/util/app_size.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'dart:ui' as ui;

import '../../../routes/app_pages.dart';
import '../../../util/app_color.dart';
import '../../../util/transection_search.dart';
import '../../../widgets/arrow_back_button.dart';
import '../../../widgets/transection_tile.dart';
import '../controllers/activity_controller.dart';

class ActivityView extends GetView<ActivityController> {

  ActivityController controller=Get.put(ActivityController());
   ActivityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SalesData> dataDay = [
      SalesData('9:00', 5),
      SalesData('10:00', 8),
      SalesData('11:00', 14),
      SalesData('12:00', 12),
      SalesData('13:00', 10),
      SalesData('14:00', 16),
      SalesData('15:00', 15),
      SalesData('16:00', 20),
      SalesData('17:00', 18),
      SalesData('18:00', 17),
    ];
    List<SalesData> dataWeek = [
      SalesData('Sat', 5),
      SalesData('Sun', 8),
      SalesData('Mon', 14),
      SalesData('Tues', 12),
      SalesData('Wed', 10),
      SalesData('Thu', 16),
      SalesData('Fri', 15),
    ];
    List<SalesData> dataMonth = [
      SalesData('Jan', 5),
      SalesData('Feb', 8),
      SalesData('Mar', 14),
      SalesData('Apr', 12),
      SalesData('May', 10),
      SalesData('June', 16),
      SalesData('July', 15),
      SalesData('Aug', 20),
      SalesData('Sep', 18),
      SalesData('Oct', 17),
      SalesData('Nov', 9),
      SalesData('Dec', 6),
    ];
    List<SalesData> dataYear = [
      SalesData('2016', 5),
      SalesData('2017', 9),
      SalesData('2018', 14),
      SalesData('2019', 12),
      SalesData('2020', 10),
      SalesData('2021', 16),
      SalesData('2022', 15),
      SalesData('2023', 20),
      SalesData('2024', 18),
      SalesData('2025', 17),
    ];

    return SafeArea(
      child: Scaffold(
        body: SlidingUpPanel(
          maxHeight: screenHeight,

          color:  Colors.white,//Color(0xFFF4F5FA),
          boxShadow: const [BoxShadow(blurRadius: 0,color: Color(0xFFF4F5FA),)],



          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 10.0),
                    child: ArrowBackButton(
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding:  EdgeInsets.only(
                        right: screenWidth * 0.095),
                    child: Text(
                      "Activity",style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700,
                        fontSize: 22
                    ),
                    ),
                  ),
                  const Spacer(),


                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 70,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Get.toNamed(Routes.ACTIVITY_DETAIL);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                          ),
                          height: 50,
                          width: screenWidth - 50,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Visa",
                                style: GoogleFonts.roboto(
                                  color: AppColors.colorLightWhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text("**** 1123",
                                    style: GoogleFonts.roboto(
                                      color: AppColors.colorLightWhite,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Image.network(
                                    'https://p7.hiclipart.com/preview/314/877/264/credit-card-debit-card-mastercard-logo-visa-go-vector-thumbnail.jpg',
                                    height: 42,
                                    width: 28,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),

              const SizedBox(height: 10,),


              Text(
                'Total Spending',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: const Color(0xFF6B7280),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,

                ),
              ),



              Text(
                '\$5,215.00',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: const Color(0xFF1D3A6F),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),





              DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    Container(
                      height: screenHeight * 0.070,
                      width: screenWidth,
                      decoration: const BoxDecoration(
                          // color: Color(0xffE5E5E5),
                          ),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: TabBar(
                          tabAlignment: TabAlignment.center,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: const UnderlineTabIndicator(
                            borderSide: BorderSide(
                              width: 2,
                              color: AppColors.colorLightBlue,
                            ),
                            insets: EdgeInsets.symmetric(horizontal: 0),
                          ),
                          isScrollable: true,
                          dividerColor: AppColors.colorLightWhite,
                          tabs: [
                            Text(
                              'Day',
                              style: GoogleFonts.roboto(
                                color: const Color(0xFF1D3A6F),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Week',
                              style: GoogleFonts.roboto(
                                color: const Color(0xFF1D3A6F),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Month',
                              style: GoogleFonts.roboto(
                                color: const Color(0xFF1D3A6F),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Year',
                              style: GoogleFonts.roboto(
                                color: const Color(0xFF1D3A6F),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight / 2 - 75,
                      child: TabBarView(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              children: [
                                Container(
                                  child: SfCartesianChart(
                                    primaryXAxis: CategoryAxis(),
                                    series: <CartesianSeries<SalesData, String>>[
                                      AreaSeries<SalesData, String>(
                                          dataSource: dataDay,
                                          onCreateShader: (ShaderDetails details) {
                                            return ui.Gradient.linear(
                                                details.rect.bottomLeft,
                                                details.rect.bottomRight, <Color>[
                                              AppColors.colorBlueLite
                                            ], <double>[
                                              0.5,
                                            ]);
                                          },
                                          xValueMapper: (SalesData data, _) =>
                                              data.year,
                                          yValueMapper: (SalesData data, _) =>
                                              data.sales)
                                    ],
                                  ),
                                ),

                                //Html(data: "${shopController.apiShopProductDetailMap?["data"]["product"]["short_description"]}"),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    child: SfCartesianChart(
                                      primaryXAxis: CategoryAxis(),
                                      series: <CartesianSeries<SalesData, String>>[
                                        AreaSeries<SalesData, String>(
                                            dataSource: dataWeek,
                                            onCreateShader:
                                                (ShaderDetails details) {
                                              return ui.Gradient.linear(
                                                  details.rect.bottomLeft,
                                                  details.rect.bottomRight, <Color>[
                                                AppColors.colorBlueLite
                                              ], <double>[
                                                0.5,
                                              ]);
                                            },
                                            xValueMapper: (SalesData data, _) =>
                                                data.year,
                                            yValueMapper: (SalesData data, _) =>
                                                data.sales)
                                      ],
                                    ),
                                  ),

                                  //Html(data: "${shopController.apiShopProductDetailMap?["data"]["product"]["short_description"]}"),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    child: SfCartesianChart(
                                      primaryXAxis: CategoryAxis(),
                                      series: <CartesianSeries<SalesData, String>>[
                                        AreaSeries<SalesData, String>(
                                            dataSource: dataMonth,
                                            onCreateShader:
                                                (ShaderDetails details) {
                                              return ui.Gradient.linear(
                                                  details.rect.bottomLeft,
                                                  details.rect.bottomRight, <Color>[
                                                AppColors.colorBlueLite
                                              ], <double>[
                                                0.5,
                                              ]);
                                            },
                                            xValueMapper: (SalesData data, _) =>
                                                data.year,
                                            yValueMapper: (SalesData data, _) =>
                                                data.sales)
                                      ],
                                    ),
                                  ),

                                  //Html(data: "${shopController.apiShopProductDetailMap?["data"]["product"]["short_description"]}"),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    child: SfCartesianChart(
                                      primaryXAxis: CategoryAxis(),
                                      series: <CartesianSeries<SalesData, String>>[
                                        AreaSeries<SalesData, String>(
                                            dataSource: dataYear,
                                            onCreateShader:
                                                (ShaderDetails details) {
                                              return ui.Gradient.linear(
                                                  details.rect.bottomLeft,
                                                  details.rect.bottomRight, <Color>[
                                                AppColors.colorBlueLite
                                              ], <double>[
                                                0.5,
                                              ]);
                                            },
                                            xValueMapper: (SalesData data, _) =>
                                                data.year,
                                            yValueMapper: (SalesData data, _) =>
                                                data.sales)
                                      ],
                                    ),
                                  ),

                                  //Html(data: "${shopController.apiShopProductDetailMap?["data"]["product"]["short_description"]}"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),







            ],
          ),
          panel: Container(
            decoration: const BoxDecoration(
                color: AppColors.colorLightWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.0),
                  topRight: Radius.circular(35.0),
                )),
            child: Container(

              child: Column(
                children: [

                  const Divider(thickness:5 ,indent: 130,endIndent: 130,),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                    child: TransectionSearch(title: 'Recent Transactions', textEditingController: controller.transectionSearchController, icon: Icon(Icons.search),)


                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       'Recent Transactions',
                    //       style: GoogleFonts.poppins(
                    //         color: const Color(0xFF060F27),
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w600,
                    //         height: 0,
                    //       ),
                    //     ),
                    //     const Icon(Icons.search)
                    //
                    //   ],
                    // ),


                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return  const TransectionTile(
                            title: 'Net Flix',
                            subtitle: 'Entertainment',
                            amount: '-\$ 10',
                            imageLink:
                            'https://variety.com/wp-content/uploads/2019/02/netflix-logo-originals.jpg?w=640',
                            amountColor: Colors.red,
                          );
                        }),
                  ),
                  const SizedBox(height: 100,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
