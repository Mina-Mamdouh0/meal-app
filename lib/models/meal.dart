import 'package:flutter/material.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}
enum Affordability {
  Affordable,
  Luxurious,
  Pricey,
}

class Meal {
  final String id;
  final List<String>? categories;
  final String ?title;
  final Affordability? affordability;
  final Complexity? complexity;
  final String? imageUrl;
  final int? duration;
  final List<String>? ingredients;
  final List<String>? steps;
  final bool? isGlutenFree;
  final bool? isVegan;
  final bool? isVegetarian;
  final bool? isLactoseFree;

  const Meal(
      {required this.id,
      this.categories,
      this.title,
      this.affordability,
      this.complexity,
      this.imageUrl,
      this.duration,
      this.ingredients,
      this.steps,
      this.isGlutenFree,
      this.isVegan,
      this.isVegetarian,
      this.isLactoseFree});
}
