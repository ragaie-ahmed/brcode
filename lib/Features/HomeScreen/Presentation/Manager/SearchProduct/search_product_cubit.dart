import 'package:Alaqsa/Core/utils/LocalStorage.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/SearchProduct/search_product_state.dart';
import 'package:Alaqsa/Features/HomeScreen/data/Model/AllProduct.dart';
import 'package:Alaqsa/Features/HomeScreen/data/Model/Searchproduct.dart';
import 'package:Alaqsa/Features/HomeScreen/data/repo/HomeRepo.dart';
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

  Future<void> getSearchProduct(String barcode) async {
    emit(LoadingSearch());
    try {
      if (await InternetConnectionChecker().hasConnection) {
        var result = await allProductRepo.searchProduct(barcode: barcode);
        searchproduct = result;
        var results = await allProductRepo.fetchAllProduct();
        listProduct = results;
        await saveProductsToHive(listProduct);
        emit(SuccessSearch());
      } else {
        searchProductByBarcode(barcode);
        emit(CacheSuccess());
      }
    } catch (e) {
      emit(ErrorSearch(error: e.toString()));
      print(e.toString());
    }
  }

  Future<AllProduct?> searchProductByBarcode(String barcode) async {
    try {
      List<AllProduct> products = await getProductsFromHive();

      if (products.isNotEmpty) {
        allProduct = products.firstWhere(
          (element) => element.barcode == barcode,
          orElse: () => AllProduct(id: 0, title: "", barcode: ''),
        );

        if (allProduct != null) {
        } else {
          emit(ErrorSearch(error: 'يوجد خطأ فى الماسح : $barcode'));
        }
      } else {
        emit(ErrorSearch(error: 'المنتج غير متاح الان '));
      }
    } catch (e) {
      // Handle errors
      emit(ErrorSearch(error: e.toString()));
      print(e.toString());
      return null;
    }
    return null;
  }
}
