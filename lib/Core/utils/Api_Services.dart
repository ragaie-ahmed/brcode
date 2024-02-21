import 'dart:convert';
import 'package:http/http.dart'as http;
class ApiServices{
  final String baseurl="https://elshakssoft.net/barcode/public/api/";
  Future<Map<String,dynamic>>get(String endPoint) async{
    http.Response response=await http.get(Uri.parse("$baseurl$endPoint"));
    var data =jsonDecode(response.body);
    return data;
  }
post(String endPoint,Map<String,dynamic> body)async{
    http.Response response=await http.post(Uri.parse("$baseurl$endPoint"),
    body: body,
    );
      return response;
  }
}