import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterscanner/Features/HomeScreen/Presentation/Manager/AllProductCubit/all_product_state.dart';
import 'package:flutterscanner/Features/HomeScreen/data/Model/AllProduct.dart';
import 'package:flutterscanner/Features/HomeScreen/data/repo/HomeRepo.dart';
class AllProductCubit extends Cubit<AllProductState> {
  AllProductCubit({required this.allProductRepo}) : super(AllProductInitial());
  static AllProductCubit get(context)=>BlocProvider.of(context);
  AllProductRepo allProductRepo;
  List<AllProduct> listProduct=[];
  Future<void>fetchAllProduct()async{
    emit(LoadingProduct());
    try {
      var result = await allProductRepo.fetchAllProduct();
      listProduct=result;
      debugPrint("result $listProduct");
      emit(SuccessFetch());

    } catch(e){
      emit(ErrorFetch(error: e.toString()));
    }
  }
}
