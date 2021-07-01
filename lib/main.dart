import 'package:flutter/material.dart';
import './screen/filter_screen.dart';
import './screen/category_meals_screen.dart';
import './screen/category_screen.dart';
import './screen/meal_detail_screen.dart';
import './screen/tabs_screen.dart';
import 'dummy_data.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };
  List<Meal> _availableMeal=DUMMY_MEALS;
  List<Meal> _favoriteMeal=[];

  void _setFilters( Map<String, bool> filterDate){
    setState(() {
      _filters=filterDate;
      _availableMeal=DUMMY_MEALS.where((meal){
        if(_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        return true;
      }).toList();

    });

  }
  void _toggleFavorite(String mealId){
    final existingIndex=_favoriteMeal.indexWhere((meal) => meal.id==mealId);
    if(existingIndex>=0){
     setState(() {
       _favoriteMeal.removeAt(existingIndex);
     });
    }
    else{
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
      });
    }
  }
  bool _isMealFavorite(String mealId){
   return _favoriteMeal.any((meal) => meal.id==mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        accentColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  color: Color.fromRGBO(20, 20, 50, 1),
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.w900),
            ),
      ),
      initialRoute: TabsScreen.routeName,
      routes: {
        CategoryScreen.routeName: (context) => CategoryScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(_availableMeal),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_toggleFavorite,_isMealFavorite),
        TabsScreen.routeName: (context) => TabsScreen(_favoriteMeal),
        FilterScreen.routeName: (context) => FilterScreen(_filters,_setFilters),
      },
    );

  }
}
