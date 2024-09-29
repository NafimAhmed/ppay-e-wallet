// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/modules/activity_detail/controller/activity_detail-controller.dart';
import 'package:p_pay/app/util/app_size.dart';
import 'package:p_pay/app/widgets/box_dropdown.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../widgets/activity_catagory_tile.dart';

class ActivityDetailViews extends GetView<ActivityDetailController> {
  const ActivityDetailViews({super.key});

  @override
  Widget build(BuildContext context) {

    final List<ChartData> data = [
      ChartData('Nov 23', 13),
      ChartData('Dec 23', 11),
      ChartData('Jan 24', 22),
      ChartData('Feb 24', 18),
      ChartData('Mar 24', 19),
      ChartData('Apr 24', 19),
    ];

    final List<ChartData> data2 = [
      ChartData('Nov 23', 0),
      ChartData('Dec 23', 0),
      ChartData('Jan 24', 0),
      ChartData('Feb 24', 0),
      ChartData('Mar 24', 0),
      ChartData('Apr 24', 0),
    ];

    final List<ChartData> data3 = [
      ChartData('Nov 23', 10),
      ChartData('Dec 23', 12),
      ChartData('Jan 24', 36),
      ChartData('Feb 24', 16),
      ChartData('Mar 24', 18),
      ChartData('Apr 24', 11),
    ];




    final TooltipBehavior tooltip = TooltipBehavior(enable: true);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
      ),
      body: Container(
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Total spending',
                style: GoogleFonts.roboto(
                  color: const Color(0xFF6B7280),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$2,265.80',
                    style: GoogleFonts.roboto(
                      color: const Color(0xFF1D3A6F),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.4,
                    height: 40,
                    child: BoxDropdown(
                      menuItem: const ['Day', 'week', 'month', 'year'],
                      hintText: 'Duration', borderRadious: 10,
                    ),
                  ),
                ],
              ),
            ),


            Card(
              margin: const EdgeInsets.all(8),
              child: SfCartesianChart(

                  primaryXAxis: CategoryAxis(),
                  primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
                  tooltipBehavior: tooltip,
                  // title: ChartTitle(
                  //     text: 'Monthly Confirmed Order and Export with Value'),
                  series: <ChartSeries<ChartData, String>>[
                    ColumnSeries<ChartData, String>(
                      spacing: 2.5,
                        dataSource: data,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        name: '',
                        color: const Color.fromRGBO(8, 142, 255, 1)),

                    ColumnSeries<ChartData, String>(

                        dataSource: data2,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        name: '',
                        color: Colors.green),
                    ColumnSeries<ChartData, String>(
                      spacing: 2.5,
                        dataSource: data3,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        name: '',
                        color: Colors.indigo)
                  ]),
            ),


            Row(
              children: [

                Container(
                  width: 155.50,
                  height: 64,
                  padding: const EdgeInsets.all(12),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: Color(0xFFF3F4F6)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF9FAFB),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: double.infinity,
                             // padding: const EdgeInsets.symmetric(horizontal: 6.67, vertical: 4.17),
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child:Icon(Icons.arrow_downward,size: 20,),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(

                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Income',
                              style: TextStyle(
                                color: Color(0xFF6B7280),
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0.12,
                                letterSpacing: 0.30,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              '\$5,300.00',
                              style: TextStyle(
                                color: Color(0xFF1D3A6F),
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                height: 0.11,
                                letterSpacing: 0.30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 155.50,
                  height: 64,
                  padding: const EdgeInsets.all(12),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: Color(0xFFF3F4F6)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF9FAFB),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: double.infinity,
                             // padding: const EdgeInsets.symmetric(horizontal: 6.67, vertical: 4.17),
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child:Icon(Icons.arrow_upward,size: 20,),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(

                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Expense',
                              style: TextStyle(
                                color: Color(0xFF6B7280),
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0.12,
                                letterSpacing: 0.30,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              '\$5,300.00',
                              style: TextStyle(
                                color: Color(0xFF1D3A6F),
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                height: 0.11,
                                letterSpacing: 0.30,
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

            
            Container(
              width: screenWidth,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      color: Color(0xFF1D3A6F),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      height: 0.06,
                      letterSpacing: 0.30,
                    ),
                  ),






                  SizedBox(
                    width: screenWidth * 0.3,
                    height: 40,
                    child: BoxDropdown(
                      menuItem: const ['Expenses', 'Earning'],
                      hintText: 'Expanses', borderRadious: 10,
                    ),
                  ),


                ],
              ),
            ),


            const SizedBox(height: 10,),




            SizedBox(
              height: 120,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const Card(child: ActivityCatagoryTile(icon: Icon(Icons.account_balance,size: 30,), title: 'Investment', amount: '\$ 5300',));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}