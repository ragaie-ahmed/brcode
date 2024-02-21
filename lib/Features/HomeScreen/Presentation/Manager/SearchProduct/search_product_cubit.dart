import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/FetchData/cache_data_cubit.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/SearchProduct/search_product_state.dart';
import 'package:Alaqsa/Features/HomeScreen/data/Model/AllProduct.dart';
import 'package:Alaqsa/Features/HomeScreen/data/Model/Searchproduct.dart';
import 'package:Alaqsa/Features/HomeScreen/data/repo/HomeRepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SearchProductCubit extends Cubit<SearchProductState> {
  SearchProductCubit({required this.allProductRepo})
      : super(SearchProductInitial());

  static SearchProductCubit get(context) => BlocProvider.of(context);
  AllProductRepo allProductRepo;
  Searchproduct? searchproduct;
  List<AllProduct> listProduct = [];

  AllProduct? allProduct;

  Future<void> getSearchProduct(String barcode, BuildContext context) async {
    emit(LoadingSearch());
    try {
      if (await InternetConnectionChecker().hasConnection) {
        var result = await allProductRepo.searchProduct(barcode: barcode);
        searchproduct = result;
        emit(SuccessSearch());
      } else {
        allProduct =
            await CacheDataCubit.get(context).searchProductByBarcode(barcode);
        if (allProduct != null) {
          emit(CacheSuccess());
        } else {
          emit(ErrorSearch(
              error: 'Cache retrieval failed for barcode: $barcode'));
        }
      }
    } catch (e) {
      emit(ErrorSearch(error: e.toString()));
      print(e.toString());
    }
  }
}
