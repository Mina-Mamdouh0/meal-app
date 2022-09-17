import 'package:flutter/material.dart';
import 'package:meal_app/providers/mealprovider.dart';
import 'package:meal_app/widget/meal_item.dart';
import 'package:provider/provider.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Meal> favoriteMeal=Provider.of<MealProvider>(context).favoriteMeal;
    return Scaffold(
      body: Center(
        child: (favoriteMeal.isEmpty)?
        Center(
          child: Text('You have no favorite yet - start adding some!'),
        ):
        ListView.builder(
            itemCount: favoriteMeal.length,
            itemBuilder: (context, index) {
              return MealItem(
                id: favoriteMeal[index].id,
                title:favoriteMeal[index].title!,
                duration:favoriteMeal[index].duration!,
                imageUrl:favoriteMeal[index].imageUrl!,
                complexity:favoriteMeal[index].complexity!,
                affordability:favoriteMeal[index].affordability!,
              );
            }
        ),
      ),
    );
  }
}
