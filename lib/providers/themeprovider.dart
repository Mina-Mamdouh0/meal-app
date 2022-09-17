
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{
var primaryColor=Colors.pink;
var accentColor=Colors.amber;
var themeMode=ThemeMode.system;
String textTheme='s';

onChange(color,n)async{
  n==1?primaryColor=toMaterialColor(color.hashCode)
      :accentColor=toMaterialColor(color.hashCode);
  notifyListeners();
  SharedPreferences pref=await SharedPreferences.getInstance();
  pref.setInt('primaryColor',primaryColor.value );
  pref.setInt('accentColor',accentColor.value );
}

getColor()async{
  /*SharedPreferences pref=await SharedPreferences.getInstance();
  primaryColor=toMaterialColor(pref.getInt('primaryColor'))??0xFFE91E63;
  accentColor=toMaterialColor(pref.getInt('accentColor' ))??0xFFFFC107;
  notifyListeners();*/
}
MaterialColor toMaterialColor(dynamic colorVal){
  return MaterialColor(
      colorVal,
      <int, Color>{
  50: Color(0xFFFFEBEE),
  100: Color(0xFFFFCDD2),
  200: Color(0xFFEF9A9A),
  300: Color(0xFFE57373),
  400: Color(0xFFEF5350),
  500: Color(colorVal),
  600: Color(0xFFE53935),
  700: Color(0xFFD32F2F),
  800: Color(0xFFC62828),
  900: Color(0xFFB71C1C),
  }
  );
}

void themeModeChange(newThemeVal)async{
  themeMode=newThemeVal;
  getTextTheme(newThemeVal);
  notifyListeners();
  SharedPreferences pref=await SharedPreferences.getInstance();
  pref.setString('textTheme',textTheme );
}
getTextTheme(ThemeMode tm){
  if(tm==ThemeMode.dark){
    textTheme='d';
  }
  else if(tm==ThemeMode.light){
    textTheme='l';
  }else if(tm==ThemeMode.system){
    textTheme='s';
  }
}

getThemeMode()async{
  SharedPreferences pref=await SharedPreferences.getInstance();
  textTheme=pref.getString('textTheme')??'s';
  if(textTheme=='d'){
    themeMode=ThemeMode.dark;
  }
  else if(textTheme=='d'){
    themeMode=ThemeMode.light;
  }else if(textTheme=='s'){
    themeMode=ThemeMode.system;
  }
notifyListeners();
}

}