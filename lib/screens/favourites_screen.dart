import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meals.dart';

class FavouritesScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  FavouritesScreen(this.favouriteMeals);

  @override
  // ignore: library_private_types_in_public_api
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favouriteMeals.isEmpty) {
      return const Center(
        child: Text(
          'No favourite meals found.',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
        ),
      );
    } else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: widget.favouriteMeals[index].id,
              title: widget.favouriteMeals[index].title,
              imageUrl: widget.favouriteMeals[index].imageUrl,
              duration: widget.favouriteMeals[index].duration,
              complexity: widget.favouriteMeals[index].complexity,
              affordability: widget.favouriteMeals[index].affordability,
            );
          },
          itemCount: widget.favouriteMeals.length);
    }
  }
}