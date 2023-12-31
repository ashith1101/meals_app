import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({super.key, 
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple'; // return 'Simple' if complexity is Complexity.Simple
      case Complexity.Challenging:
        return 'Challenging'; // return 'Challenging' if complexity is Complexity.Challenging
      case Complexity.Hard:
        return 'Hard'; // return 'Hard' if complexity is Complexity.Hard
      default:
        return 'Unknown'; // return 'Unknown' if complexity is unknown
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable'; // return 'Affordable' if affordability is Affordability.Affordable
      case Affordability.Pricey:
        return 'Pricey'; // return 'Pricey' if affordability is Affordability.Pricey
      case Affordability.Luxurious:
        return 'Luxurious'; // return 'Luxurious' if affordability is Affordability.Luxurious
      default:
        return 'Unknown'; // return 'Unknown' if affordability is unknown
    }
  }


  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName, // push to meal_detail_screen.dart
      arguments: id, // pass the id of the meal
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true, // wrap text if it's too long
                      overflow: TextOverflow.fade, // fade text if it's too long
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, // evenly space the items
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(Icons.schedule),
                      const SizedBox(width: 6),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.work),
                      const SizedBox(width: 6),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 6),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
