import 'package:flutter/material.dart';
import '../widget/category_item.dart';
import '../dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName='CategoryScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(15.0),
        children: DUMMY_CATEGORIES
            .map((categoryItem) => CategoryItem(
          id: categoryItem.id,
          color: categoryItem.color,
          title: categoryItem.title,
        ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 3,
            mainAxisExtent: 150),
      ),
    );
  }
}

