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
emit(SuccessSearch());
    }catch(e){
      emit(ErrorSearch(error: e.toString()));
    }

  }


}
