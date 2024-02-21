import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
static late  SharedPreferences sharedPreferences;
static getinit() async{
sharedPreferences=await SharedPreferences.getInstance();
}
static  putData({required String key,required int value}) async{
  return await sharedPreferences.setInt(key, value);
}
static  getData({required String key}) {
  return  sharedPreferences.getInt(key);
}
static Future<bool> deleteData({required String key})async{
  return await sharedPreferences.remove(key);
}
}