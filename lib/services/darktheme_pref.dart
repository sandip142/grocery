import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePref{
   static const themekey="THEME_STATUS";
  //to use this in future for  changing in theme purpose
  setDarkThemePref(bool value) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(themekey, value);
  }

  Future<bool> getTheme() async{
      SharedPreferences pref=await SharedPreferences.getInstance();
      return pref.getBool(themekey)??false;
      //?? for intialize first value  because it is return nothing 
  }
}