
import 'dart:convert';
import 'package:http/http.dart'as http;
class ApiServices{
  final String baseurl="https://elshakssoft.net/barCode/barcode/public/api/products/";
  Future<Map<String,dynamic>>get(String endPoint) async{
    http.Response response=await http.get(Uri.parse("$baseurl$endPoint"));
    var data =jsonDecode(response.body);
    return data;
  }
}