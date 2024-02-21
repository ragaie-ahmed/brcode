import 'package:Alaqsa/Core/utils/Const.dart';
import 'package:Alaqsa/Core/utils/LocalStorage.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/FetchData/cache_data_state.dart';
import 'package:Alaqsa/Features/HomeScreen/data/Model/AllProduct.dart';
import 'package:Alaqsa/Features/HomeScreen/data/repo/HomeRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CacheDataCubit extends Cubit<CacheDataState> {
  CacheDataCubit({required this.allProductRepo}) : super(CacheDataInitial());

  static CacheDataCubit get(context) => BlocProvider.of(context);
  AllProductRepo allProductRepo;
  AllProduct? allProduct;

  void fetchAndCacheProducts() async {
    var results = await allProductRepo.fetchAllProduct(AppConstant.userid!);
    await saveProductsToHive(results);
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
          emit(CacheSuccess());
        } else {
          emit(ErrorSearch(error: 'Product not found in cache: $barcode'));
        }
      } else {
        emit(ErrorSearch(error: 'Cache is empty'));
      }
    } catch (e) {
      // Handle errors
      emit(ErrorSearch(error: 'Cache retrieval error: $e'));
      print('Cache retrieval error: $e');
      return null;
    }
    return allProduct;
  }
}
