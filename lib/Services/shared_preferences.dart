import 'package:shared_preferences/shared_preferences.dart';
class LocalStorage {
  static String key ="onboarding_completed";
 static Future<void> setOnBoardingCompleted() async{
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(key,true);
  }
  static Future<bool> isOnBoardingCompleted() async{
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(key) ?? false;
  }
}