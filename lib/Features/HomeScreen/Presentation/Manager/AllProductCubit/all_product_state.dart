
import 'package:flutterscanner/Features/HomeScreen/data/Model/AllProduct.dart';

abstract class AllProductState {}
class AllProductInitial extends AllProductState {}
class LoadingProduct extends AllProductState {}
class SuccessFetch extends AllProductState {


}
class ErrorFetch extends AllProductState {
  final String error;

  ErrorFetch({required this.error});

}

