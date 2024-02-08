import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutterscanner/Features/HomeScreen/data/Model/Searchproduct.dart';

class GenerateBarCode extends StatelessWidget {
  const GenerateBarCode({super.key,required this.searchproduct});
 final Searchproduct searchproduct;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: BarcodeWidget(
        height: 90,
        width: 100,
        barcode: Barcode.code128(),
        data: searchproduct.barcode.toString(),
      ),
    );
  }
}
