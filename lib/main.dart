import 'package:flutter/material.dart';
import 'package:meal_app/providers/themeprovider.dart';
import 'package:meal_app/screen/themescreen.dart';

import './screen/filter_screen.dart';
import './screen/category_meals_screen.dart';
import './screen/category_screen.dart';
import './screen/meal_detail_screen.dart';
import './screen/tabs_screen.dart';
import 'package:provider/provider.dart';

import 'providers/mealprovider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
    ChangeNotifierProvider<MealProvider>(
    create: (context)=>MealProvider()),
      ChangeNotifierProvider<ThemeProvider>(
          create: (context)=>ThemeProvider()),
    ],
    child:MyApp() ,)
     );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var primaryColor=Provider.of<ThemeProvider>(context).primaryColor;
    var accentColor=Provider.of<ThemeProvider>(context).accentColor;
    var themeMode=Provider.of<ThemeProvider>(context).themeMode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      themeMode:themeMode,
      theme: ThemeData(
        primarySwatch: primaryColor,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        accentColor: accentColor,
        buttonColor: Colors.black87,
        cardColor: Colors.white,
        shadowColor: Colors.black87,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline6: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold),
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: primaryColor,
        canvasColor: Color.fromRGBO(14, 22, 33, 1),
        accentColor: accentColor,
        buttonColor: Colors.white,
        cardColor: Color.fromRGBO(14, 22, 33, 1),
        shadowColor: Colors.white60,
        fontFamily: 'Raleway',
        unselectedWidgetColor: Colors.white,
        textTheme: ThemeData.dark().textTheme.copyWith(
          bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
              ),
          headline6: TextStyle(
            color: Colors.white70,
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold),
        ),
      ),
      initialRoute: TabsScreen.routeName,
      routes: {
        CategoryScreen.routeName: (context) => CategoryScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        TabsScreen.routeName: (context) => TabsScreen(),
        FilterScreen.routeName: (context) => FilterScreen(),
        ThemeScreen.routeName: (context) => ThemeScreen(),
      },
    );

  }
}
