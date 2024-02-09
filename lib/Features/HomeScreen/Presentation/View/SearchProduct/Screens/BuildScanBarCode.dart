import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
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
      appBar: AppBar(
        title: const Text("Scan_BarCode"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                var res = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SimpleBarcodeScannerPage(),
                  ),
                );

                if (res != null && res is String) {
                  setState(() {
                    result = res;
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
              },
              child: const Text('Open Scanner'),
            ),
          ),
        ],
      ),
    );
  }
}
