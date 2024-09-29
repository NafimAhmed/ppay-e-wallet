import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/modules/my_qr_code/controller/my_qr_code_controller.dart';
import 'package:p_pay/app/util/app_color.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../util/app_local_stroge.dart';

class MyQRCodeViews extends GetView<MyQRCodeController> {
  const MyQRCodeViews({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Center(
        child: Text('My QR Code',
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold
          ),


        ),
      ),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/app_logo.png'),

            QrImageView(
              data: '${getStorage.read('qr_code')}',
              version: QrVersions.auto,
              size: 240.0,
              //embeddedImage: AssetImage('assets/images/p_pay_logo_small.png'),
              foregroundColor: AppColors.colorBlue,
            ),


            // Container(
            //   width: 240,
            //   height: 240,
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //       image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/QR_code_for_mobile_English_Wikipedia.svg/1200px-QR_code_for_mobile_English_Wikipedia.svg.png"),
            //       fit: BoxFit.fill,
            //     ),
            //   ),
            // )


          ],
        ),
      ),
    );
  }
}
