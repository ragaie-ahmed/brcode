import 'package:Alaqsa/Core/utils/Api_Services.dart';
import 'package:Alaqsa/Features/HomeScreen/data/Model/AllProduct.dart';
import 'package:Alaqsa/Features/HomeScreen/data/Model/Searchproduct.dart';
import 'package:Alaqsa/Features/HomeScreen/data/repo/HomeRepo.dart';

class AllProductImplementation implements AllProductRepo {
  final ApiServices apiServices;

  @override

  AllProductImplementation({required this.apiServices});

  Future<List<AllProduct>> fetchAllProduct() async {
    var data = await apiServices.get("allProudcts");
    List<AllProduct> listProduct = [];
    for (var item in data["data"]) {
      listProduct.add(AllProduct.fromJson(item));
    }
    return listProduct;
  }

  @override
  Future<Searchproduct> searchProduct({required String barcode}) async {
    Searchproduct searchproduct;

    var data = await apiServices.get("search/$barcode");
    searchproduct = Searchproduct.fromJson(data["data"]);
    return searchproduct;
  }
}
