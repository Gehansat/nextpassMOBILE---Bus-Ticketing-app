import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePage extends StatelessWidget {
  final String qrCodeData;

  QRCodePage(this.qrCodeData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
      ),
      body: Center(
        child: QrImageView(
          data: qrCodeData,
          version: QrVersions.auto,
          size: 250.0,
        ),
      ),
    );
  }
}