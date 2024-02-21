import 'dart:convert';
import 'package:Alaqsa/Core/utils/Api_Services.dart';
import 'package:Alaqsa/Features/HomeScreen/data/Model/AllProduct.dart';
import 'package:Alaqsa/Features/HomeScreen/data/Model/Searchproduct.dart';
import 'package:Alaqsa/Features/HomeScreen/data/repo/HomeRepo.dart';
import 'package:http/http.dart' as http;
class AllProductImplementation implements AllProductRepo {
  final ApiServices apiServices;

  @override
  AllProductImplementation({required this.apiServices});

  Future<List<AllProduct>> fetchAllProduct(int id) async {
    var data = await apiServices.get("products/allProudcts/$id");
    List<AllProduct> listProduct = [];
    for (var item in data["data"]) {
      listProduct.add(AllProduct.fromJson(item));
    }
    return listProduct;
  }

  @override
  Future<Searchproduct> searchProduct({required String barcode}) async {
    Searchproduct searchproduct;

    var data = await apiServices.get("products/search/$barcode");

    searchproduct = Searchproduct.fromJson(data["data"]);
    return searchproduct;
  }

  @override

  Future<Map<String, dynamic>> logIn(
      {required String kayWord, required String userSelral}) async {
    try {
      http.Response response = await http.post(
        Uri.parse("https://elshakssoft.net/barcode/public/api/login"),
        body: {'kayWord': kayWord, 'userSelral': userSelral},
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        return responseData;
      } else {
        throw Exception('Failed to log in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during login request: $e');
      throw e;
    }
  }

}
