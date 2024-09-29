import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:p_pay/app/modules/notification/controller/notification_controller.dart';
import 'package:p_pay/app/util/app_color.dart';

class NotificationViews extends GetView<NotificationController> {
  const NotificationViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            width: 327,
            child: const Text(
              'Today',
              style: TextStyle(
                color: AppColors.colorLightGrey, //Color(0xFF6B7280),
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                height: 0.09,
                letterSpacing: 0.30,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const ListTile(
                leading: Icon(Icons.currency_exchange),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rewards',
                      style: TextStyle(
                        color: AppColors.colorDeepBlue, //Color(0xFF1D3A6F),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0.09,
                        letterSpacing: 0.30,
                      ),
                    ),
                    //const SizedBox(width: 158),
                    Text(
                      '5m ago',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: AppColors.colorLightGrey, //Color(0xFF6B7280),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                        letterSpacing: 0.30,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  'Loyal user rewards!😘',
                  style: TextStyle(
                    color: AppColors.colorLightGrey, //Color(0xFF6B7280),
                    fontSize: 12,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                    letterSpacing: 0.30,
                  ),
                ),
              );
            },
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            width: 327,
            child: const Text(
              'This Week',
              style: TextStyle(
                color: AppColors.colorLightGrey, //Color(0xFF6B7280),
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                height: 0.09,
                letterSpacing: 0.30,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(), //const NeverScrollableScrollPhysics(),
              controller: controller.scrollController,
              itemCount: 16,
              itemBuilder: (context, index) {
                return const ListTile(
                  leading: Icon(Icons.credit_card),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Payment Notification',
                        style: TextStyle(
                          color: AppColors.colorDeepBlue,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          height: 0.09,
                          letterSpacing: 0.30,
                        ),
                      ),
                      //const SizedBox(width: 158),
                      Text(
                        'Mar 13',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: AppColors.colorLightGrey, //Color(0xFF6B7280),
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          height: 0.12,
                          letterSpacing: 0.30,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    'Successfully paid!🤑',
                    style: TextStyle(
                      color: AppColors.colorLightGrey, //Color(0xFF6B7280),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 0.12,
                      letterSpacing: 0.30,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
