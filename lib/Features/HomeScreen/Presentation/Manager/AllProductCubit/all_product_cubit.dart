import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/AllProductCubit/all_product_state.dart';
import 'package:Alaqsa/Features/HomeScreen/data/Model/AllProduct.dart';
import 'package:Alaqsa/Features/HomeScreen/data/repo/HomeRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllProductCubit extends Cubit<AllProductState> {
  AllProductCubit({required this.allProductRepo}) : super(AllProductInitial());
  static AllProductCubit get(context)=>BlocProvider.of(context);
  AllProductRepo allProductRepo;
  List<AllProduct> listProduct=[];

  Future<void> fetchAllProduct() async {
    emit(LoadingProduct());
    try {

        var result = await allProductRepo.fetchAllProduct();
        listProduct = result;
        emit(SuccessFetch());

    } catch (e) {
      emit(ErrorFetch(error: e.toString()));
      print(e.toString());
    }
  }


}
