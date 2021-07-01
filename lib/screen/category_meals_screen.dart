import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widget/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'CategoryMealsScreen';
  final List<Meal> availableMeal;

  const CategoryMealsScreen(this.availableMeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  void _removeMeal(String id){
    setState(() {
     categoryMeals.removeWhere((element) => element.id == id);
    });
  }
  String titleRoute;
  List <Meal>categoryMeals;
   @override
  void didChangeDependencies() {
     final routeArg =
     ModalRoute
         .of(context)
         .settings
         .arguments as Map<String, String>;
     String idRoute = routeArg['id'];
     titleRoute = routeArg['title'];
     categoryMeals = widget.availableMeal.where((element) {
       return element.categories.contains(idRoute);
     }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(titleRoute),
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context, index) {
            return MealItem(
              id: categoryMeals[index].id,
              title:categoryMeals[index].title,
              duration:categoryMeals[index].duration,
              imageUrl:categoryMeals[index].imageUrl,
              complexity:categoryMeals[index].complexity,
              affordability:categoryMeals[index].affordability,
            );
          }
      ),
    );
  }
}
