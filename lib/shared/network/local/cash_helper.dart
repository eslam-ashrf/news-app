import 'package:shared_preferences/shared_preferences.dart';


class CashHelper{

  static SharedPreferences? sharedPreferences;
  static init ()async{
    sharedPreferences= await SharedPreferences?.getInstance();
  }
  static Future<bool> setData({
  required String key,
  required bool value,

})async{
    return await sharedPreferences!.setBool(key, value);
  }
  static bool? getData({
    required String key,
  }){
    return  sharedPreferences?.getBool(key);
  }
}