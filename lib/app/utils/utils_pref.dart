import 'package:shared_preferences/shared_preferences.dart';

class UtilsPref {


  static String isIntro = "intro";

  Future<void> setIntro(bool intro) async{
    SharedPreferences shr =  await SharedPreferences.getInstance();
    shr.setBool(isIntro, intro);
  }

  Future<bool> getIntro() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    bool intro = shr.getBool(isIntro) ?? false;
    return intro;
  }

}