




import 'dart:developer';
import 'dart:io';

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_pay/app/modules/base/controllers/base_controller.dart';
// import 'package:p_pay/app/modules/base/providers/base_provider.dart';
// import 'package:p_pay/app/modules/send_money_form/views/send_money_form_views.dart';
import 'package:p_pay/app/widgets/app_snackbar.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../routes/app_pages.dart';

class QrScanner extends StatefulWidget {

  final TextEditingController? textEditingController;

  const QrScanner({Key? key, this.textEditingController}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {

  BaseController baseController=Get.put(BaseController());
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),

        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() async {
        result = scanData;
        if (result != null){
         // widget.textEditingController!.text = result!.code!;
          controller.dispose();
         // Navigator.pop(context);
          //Get.to(SendMoneyFormView(emPhoneNumber: '${result?.code}'));

          showSnackBar('QR Tst', '${result!.code}', Colors.red, SnackPosition.BOTTOM);
          //await BaseProvider().fetchUserQRData('${result!.code}');
           await baseController.getqr('${result!.code}');

          Get.toNamed(Routes.SEND_MONEY_FORM);



          //Get.back();
        }

      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}