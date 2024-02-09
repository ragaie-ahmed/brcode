import 'package:Alaqsa/Features/HomeScreen/data/Model/Searchproduct.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class GenerateBarCode extends StatelessWidget {
   GenerateBarCode({super.key,required this.searchproduct});
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
