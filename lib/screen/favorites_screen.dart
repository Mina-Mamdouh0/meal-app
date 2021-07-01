import 'package:flutter/material.dart';
import 'package:meal_app/widget/meal_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;

  FavoritesScreen(this.favoriteMeal);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: (widget.favoriteMeal.isEmpty)?
        Center(
          child: Text('You have no favorite yet - start adding some!'),
        ):
        ListView.builder(
            itemCount: widget.favoriteMeal.length,
            itemBuilder: (context, index) {
              return MealItem(
                id: widget.favoriteMeal[index].id,
                title:widget.favoriteMeal[index].title,
                duration:widget.favoriteMeal[index].duration,
                imageUrl:widget.favoriteMeal[index].imageUrl,
                complexity:widget.favoriteMeal[index].complexity,
                affordability:widget.favoriteMeal[index].affordability,
              );
            }
        ),
      ),
    );
  }
}
