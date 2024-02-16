import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/View/SearchProduct/Screens/DetailsSearch.dart';

class BuildScan extends StatefulWidget {
  const BuildScan({Key? key}) : super(key: key);

  @override
  State<BuildScan> createState() => _BuildScanState();
}

class _BuildScanState extends State<BuildScan> {
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("مسح الباركود", style: TextStyle(fontSize: 22)),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                try {
                  String barcodeScanRes =
                      await FlutterBarcodeScanner.scanBarcode(
                    '#ff6666',
                    'Cancel',
                    true,
                    ScanMode.DEFAULT,
                  );

                  if (barcodeScanRes != '-1' &&
                      barcodeScanRes.length > 0 &&
                      barcodeScanRes.length <= 50) {
                    setState(() {
                      result = barcodeScanRes;
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsSearch(barcode: result),
                      ),
                    );
                  } else {
                    print("Barcode scan failed");
                  }
                } catch (e) {
                  print("Error scanning barcode: $e");
                }
              },
              child: const Text(
                'فتح الماسح الضوئي',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),

            ),
          ),

        ],
      ),
    );
  }
}
