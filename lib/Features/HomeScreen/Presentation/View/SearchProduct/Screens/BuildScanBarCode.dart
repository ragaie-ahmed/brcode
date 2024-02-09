import 'package:flutter/material.dart';
import 'package:flutterscanner/Features/HomeScreen/Presentation/View/SearchProduct/Screens/DetailsSearch.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class BuildScan extends StatefulWidget {
  const BuildScan({super.key});

  @override
  State<BuildScan> createState() => _BuildScanState();
}

class _BuildScanState extends State<BuildScan> {
  String result="";

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: () async {
        var res = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SimpleBarcodeScannerPage(),
            ));
        setState(() {
          if (res is String) {
            result = res;
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailsSearch(barcode: result);
            },));
          }

        });
      },
      child: const Text('Open Scanner'),
    );
  }
}
