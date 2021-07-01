import 'package:flutter/material.dart';
import 'package:meal_app/screen/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({@required this.id, @required this.title, @required this.color});

  void onSelect(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelect(context),
      splashColor: Colors.brown,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.9),
              color.withOpacity(0.5),
              color.withOpacity(0.1),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
