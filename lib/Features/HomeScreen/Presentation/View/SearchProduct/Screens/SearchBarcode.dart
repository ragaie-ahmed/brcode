import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/SearchProduct/search_product_cubit.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/SearchProduct/search_product_state.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/View/SearchProduct/Screens/BuildScanBarCode.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/View/SearchProduct/Screens/generateBarCode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
         if(state is SuccessSearch){
           return Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               GenerateBarCode(searchproduct: cubit.searchproduct!),
               BuildScan()
             ],
           );
         }
         else if(state is ErrorSearch){
           return Center(child: Text(state.error),);
         }
         return Center(child: CircularProgressIndicator());

        },
      ),
    );
  }
}
