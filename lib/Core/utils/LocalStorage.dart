import 'package:Alaqsa/Core/utils/Const.dart';
import 'package:Alaqsa/Features/HomeScreen/data/Model/AllProduct.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> saveProductsToHive(List<AllProduct> products) async {
  final box = await Hive.openBox<AllProduct>(AppConstant.listSearch);
  await box.clear();
  await box.addAll(products);
}

Future<List<AllProduct>> getProductsFromHive() async {
  final box = await Hive.openBox<AllProduct>(AppConstant.listSearch);
  final products = box.values.toList();
  return products;
}