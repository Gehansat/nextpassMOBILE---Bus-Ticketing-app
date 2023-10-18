import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeScreen extends StatelessWidget {
  final String qrData; // The data you want to encode into the QR code.

  QRCodeScreen(this.qrData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text("Scan this QR code"),
          ],
        ),
      ),
            // QrImage(
            //   data: qrData, // Set the data for the QR code.
            //   version: QrVersions.auto, // You can specify the version of the QR code if needed.
            //   size: 200, // Adjust the size of the QR code.
            // ),
    );
  }
}
