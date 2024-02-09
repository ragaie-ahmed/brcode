import 'package:Alaqsa/Features/HomeScreen/data/Model/AllProduct.dart';
import 'package:Alaqsa/Features/HomeScreen/data/Model/Searchproduct.dart';

abstract class AllProductRepo{
  Future<List<AllProduct>> fetchAllProduct();
  Future<Searchproduct> searchProduct({required String barcode});

}