import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:path_provider/path_provider.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class QRScreen extends StatefulWidget {
  @override
  _QRScreenState createState() => _QRScreenState();
}


class PassType {
  final String SelectedPackage;
  final String Cost;
  final String Days;

  PassType({
    required this.SelectedPackage,
    required this.Cost,
    required this.Days,
  });

  factory PassType.fromJson(Map<String, dynamic> json) {
    return PassType(
      SelectedPackage: json['SelectedPackage'] ?? '',
      Cost: json['Cost'] ?? '',
      Days: json['Days'] ?? '',
    );
  }
}

class _QRScreenState extends State<QRScreen> {
  final GlobalKey qrKey = GlobalKey();
  String passTypeDetails = '';
  String SelectedPackage = '';
  String Cost = '';
  String Days = '';

  @override
  void initState() {
    super.initState();
    fetchDataFromFirebase().then((data) {
      setState(() {
        passTypeDetails = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'QR Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                _showQrDialog(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Show QR Code',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Text(
            //   'Pass Type Details: $passTypeDetails',
            //   style: TextStyle(fontSize: 16),
            // ),
          ],
        ),
      ),
    );
  }

  void _showQrDialog(BuildContext context) {
  // Fetch Firestore data here
  getPricePackages().then((_) {
    // After data is fetched, show the QR code
    final qrData = 'Name: $SelectedPackage\nCost: $Cost\nDays: $Days'; // Create QR data based on fetched Firestore data

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'QR Code',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RepaintBoundary(
                key: qrKey,
                child: BarcodeWidget(data: qrData, barcode: Barcode.qrCode()),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                await saveQRCodeImage(qrKey);
                Navigator.of(context).pop();
              },
              child: Center(
                child: const Text(
                  'Save QR Code',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  });
}

Future<void> getPricePackages() async {
  final reference = FirebaseFirestore.instance
      .collection("userPackages")
      .doc("PBACeSorZpZmiWiXIDmE");

  final snapshot = await reference.get();
  final result =
      snapshot.data() == null ? null : PassType.fromJson(snapshot.data()!);

  setState(() {
    SelectedPackage = result?.SelectedPackage ?? '';
    Cost = result?.Cost ?? '';
    Days = result?.Days ?? '';
  });
}


  Future<void> saveQRCodeImage(GlobalKey key) async {
    RenderRepaintBoundary boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List buffer = byteData!.buffer.asUint8List();

    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(buffer));
    if (result['isSuccess'] == true) {
      print('Image saved to gallery: ${result['filePath']}');
    } else {
      print('Image save failed');
    }
  }

  // Future<void> _sendEmailWithQR(String recipient, String qrData) async {
  //   String username = 'your_email@gmail.com'; // Your Gmail email
  //   String password = 'your_app_specific_password'; // Your Gmail app-specific password

  //   final smtpServer = gmail(username, password);

  //   final message = Message()
  //     ..from = Address(username, 'Your Name')
  //     ..recipients.add(recipient)
  //     ..subject = 'Your QR code'
  //     ..html = "<h1>Here is your QR code</h1>\n<p>Check the attachment.</p>";

  //   File imgFile = await captureQRAsImage(qrKey);
  //   message.attachments.add(FileAttachment(imgFile));

  //   try {
  //     final sendReport = await send(message, smtpServer);
  //     print('Message sent: ' + sendReport.toString());
  //   } catch (e) {
  //     print('Message not sent: ' + e.toString());
  //   }
  // }

  Future<File> captureQRAsImage(GlobalKey key) async {
    RenderRepaintBoundary boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List buffer = byteData!.buffer.asUint8List();
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File imgFile = File('$tempPath/qr_code.png');
    await imgFile.writeAsBytes(buffer);
    return imgFile;
  }
}


Future<String> fetchDataFromFirebase() async {
  final reference = FirebaseDatabase.instance.reference().child('passTypeDetails');
  DataSnapshot snapshot = (await reference.once()) as DataSnapshot;
  String passTypeDetails = snapshot.value.toString();
  return passTypeDetails;
}
