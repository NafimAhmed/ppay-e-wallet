import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/modules/general_settings/controller/general_settings_controller.dart';

class GeneralSettingsViews extends GetView<GeneralSettingController> {
  const GeneralSettingsViews({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool defaultNotificationActions = false.obs;
    RxBool billsCalendar = false.obs;
    RxBool creditScoreCalendar = false.obs;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('General Settings'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.notifications),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Default Notification Actions',
                  style: GoogleFonts.roboto(
                    color: const Color(0xFF1D3A6F),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Manage Notifications',
                  style: GoogleFonts.roboto(
                    color: const Color(0xFF1D3A6F),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                )
              ],
            ),
          ),



          const SizedBox(height: 30,),



          Obx(
            () => SwitchListTile(
              title: const Text('Default Notification Actions'),
              subtitle: Text(
                'You want to receive bill reminders before a bill is due.',
                style: GoogleFonts.roboto(
                  color: const Color(0xFF6B7280),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              value: defaultNotificationActions.value,
              onChanged: (bool value) {
                defaultNotificationActions.value = value;
              },
              //secondary: const Icon(Icons.lightbulb_outline),
            ),
          ),
          Obx(
            () => SwitchListTile(
              subtitle: Text(
                'You want to receive bill reminder emails before a bill...',
                style: GoogleFonts.roboto(
                  color: const Color(0xFF6B7280),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              title: const Text('Bills Calendar'),
              value: billsCalendar.value,
              onChanged: (bool value) {
                billsCalendar.value = value;
              },
              //secondary: const Icon(Icons.lightbulb_outline),
            ),
          ),
          Obx(
            () => SwitchListTile(
              subtitle: Text(
                'You want to sync credit score reminders tou your device cale...',
                style: GoogleFonts.roboto(
                  color: const Color(0xFF6B7280),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              title: const Text('Credit Score Calendar'),
              value: creditScoreCalendar.value,
              onChanged: (bool value) {
                creditScoreCalendar.value = value;
              },
              //secondary: const Icon(Icons.lightbulb_outline),
            ),
          ),
        ],
      ),
    );
  }
}
