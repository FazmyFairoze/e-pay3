import 'package:e_pay/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:barcode_scan/barcode_scan.dart';
//import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../../enums.dart';

class Qr extends StatefulWidget {
  static String routeName = "/qr";
  @override
  _QrState createState() => _QrState();
}

class _QrState extends State<Qr> {
  String barcodeScanRes;
  String result = "Please Scan Qr at merchant checkout";
  String _scanBarcode = 'Unknown';
  scanQr() async {
    try {
      result = await FlutterBarcodeScanner.scanBarcode(
          "#008080", "CANCEL", true, ScanMode.QR);
    } on PlatformException {
      result = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = result;
    });
    //result = barcodeScanRes;
  }
  //Future scanQr() async {
  //try {
  //ScanResult qrResult = await BarcodeScanner.scan();
  //setState(() {
  //result = qrResult.rawContent;
  //});
  //} on PlatformException catch (e) {
  //if (e.code == BarcodeScanner.cameraAccessDenied) {
  //setState(() {
  //result = "Camera permission was denied";
  //});
  //} else {
  //setState(() {
  //result = "Unknown error $e";
  //});
  //}
  //} on FormatException {
  //setState(() {
  //result = "Qr was not scanned successfully";
  //});
  //} catch (e) {
  //setState(() {
  //result = "Unknown error $e";
  //});
  //}
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          _scanBarcode,
          style: new TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        backgroundColor: Colors.deepOrange[300],
        onPressed: () {
          scanQr();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.qr),
      //child:scanQr();
    );
  }
}
