import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterscanner/Features/HomeScreen/Presentation/Manager/SearchProduct/search_product_cubit.dart';
import 'package:flutterscanner/Features/HomeScreen/Presentation/Manager/SearchProduct/search_product_state.dart';
import 'package:flutterscanner/Features/HomeScreen/Presentation/View/SearchProduct/Screens/BuildScanBardCode.dart';
import 'package:flutterscanner/Features/HomeScreen/Presentation/View/SearchProduct/Screens/generateBarCode.dart';
import 'package:flutterscanner/main.dart';

class SearchBarcode extends StatefulWidget {
  const SearchBarcode({super.key, required this.barcode});

  final String barcode;

  @override
  State<SearchBarcode> createState() => _SearchBarcodeState();
}

class _SearchBarcodeState extends State<SearchBarcode> {
  @override
  void initState() {
    SearchProductCubit.get(context).getSearchProduct(widget.barcode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<SearchProductCubit, SearchProductState>(
        builder: (context, state) {
          var cubit=SearchProductCubit.get(context);
           return Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               GenerateBarCode(searchproduct: cubit.searchproduct!),
             ],
           );

        },
      ),
    );
  }
}