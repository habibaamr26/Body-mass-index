

import 'package:shared_preferences/shared_preferences.dart';

class cachHelper{


  static SharedPreferences? shared;
  // to creat object
  static init()
  async {
    shared=await SharedPreferences.getInstance() ;
  }


  static Future<bool> putdata(
  {
    required String key,
    required bool value,}
      )
  async {
   return await shared!.setBool(key, value);
  }


  static bool? getdata(
      {
        required String key,
      }
      )
   {
    return shared!.getBool(key);
  }
}