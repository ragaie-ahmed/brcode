
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterscanner/Features/HomeScreen/Presentation/Manager/SearchProduct/search_product_state.dart';
import 'package:flutterscanner/Features/HomeScreen/data/Model/Searchproduct.dart';
import 'package:flutterscanner/Features/HomeScreen/data/repo/HomeRepo.dart';

class SearchProductCubit extends Cubit<SearchProductState> {
  SearchProductCubit({required this.allProductRepo}) : super(SearchProductInitial());
  static SearchProductCubit get(context)=>BlocProvider.of(context);
  AllProductRepo allProductRepo;
  Searchproduct? searchproduct;
  Future<void>getSearchProduct(String barcode)async{
    emit(LoadingSearch());
    try{
      var result=await allProductRepo.searchProduct(barcode: barcode);

searchproduct=result;
    }catch(e){
      emit(ErrorSearch(error: e.toString()));
    }

  }

String ? scanBarcode;
  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    scanBarcode = barcodeScanRes;
    emit(ChangeState());
  }
}
