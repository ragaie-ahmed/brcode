import 'package:Alaqsa/Features/HomeScreen/data/Model/AllProduct.dart';
import 'package:Alaqsa/Features/HomeScreen/data/Model/Searchproduct.dart';

abstract class AllProductRepo{
  Future<List<AllProduct>> fetchAllProduct(int id);
  Future<Searchproduct> searchProduct({required String barcode});
  Future<Map<String,dynamic>>  logIn({required String kayWord,required String userSelral});

}