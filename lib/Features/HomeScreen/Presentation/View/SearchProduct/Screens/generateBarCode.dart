import 'package:Alaqsa/Features/HomeScreen/data/Model/AllProduct.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class GenerateBarCode extends StatelessWidget {
   GenerateBarCode({super.key,required this.searchproduct});
 final AllProduct searchproduct;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: BarcodeWidget(
                height: 90,
                barcode: Barcode.code128(),
                data: searchproduct.barcode.toString(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
