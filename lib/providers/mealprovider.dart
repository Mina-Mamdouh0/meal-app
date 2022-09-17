
import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../dummy_data.dart';

class MealProvider extends ChangeNotifier{
  Map<String, bool> filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };
  List<Meal> availableMeal=DUMMY_MEALS;
  List<Meal> favoriteMeal=[];
  List<String> isMealId=[];
  List<Category> availableCategory=[];

  void setFilters()async{
    availableMeal=DUMMY_MEALS.where((meal){
      if(filters['gluten']! && !meal.isGlutenFree!){
        return false;
      }
      if(filters['vegan']! && !meal.isVegan!){
        return false;
      }
      if(filters['vegetarian']! && !meal.isVegetarian!){
        return false;
      }
      if(filters['lactose']! && !meal.isLactoseFree!){
        return false;
      }
      return true;
    }).toList();
    List<Category> ac=[];
    availableMeal.forEach((meal) {
      meal.categories!.forEach((catId) {
        DUMMY_CATEGORIES.forEach((cat) {
          if(cat.id==catId) {
            if(!ac.any((cat) => cat.id==catId)){
              ac.add(cat);
            }
          }
        });
      });
    });
    availableCategory=ac;

    notifyListeners();
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setBool('gluten', filters['gluten']!);
    pref.setBool('vegan', filters['vegan']!);
    pref.setBool('vegetarian', filters['vegetarian']!);
    pref.setBool('lactose', filters['lactose']!);

  }
  void getDate()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    filters['gluten']=pref.getBool('gluten')??false;
    filters['vegan']=pref.getBool('vegan')??false;
    filters['vegetarian']=pref.getBool('vegetarian')??false;
    filters['lactose']=pref.getBool('lactose')??false;
    isMealId=pref.getStringList('isMealId')??[];


    for(var mealId in isMealId){
      final existingIndex=favoriteMeal.indexWhere((meal) => meal.id==mealId);
      if(existingIndex<0){
        favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
      }
    }


    notifyListeners();
  }
  void toggleFavorite(String mealId)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    final existingIndex=favoriteMeal.indexWhere((meal) => meal.id==mealId);
    if(existingIndex>=0){
      favoriteMeal.removeAt(existingIndex);
      isMealId.remove(mealId);
    }
    else{
      favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
      isMealId.add(mealId);
    }
    notifyListeners();
    pref.setStringList('isMealId', isMealId);

  }
  bool isMealFavorite(String mealId){
    return favoriteMeal.any((meal) => meal.id==mealId);
    notifyListeners();
  }

}