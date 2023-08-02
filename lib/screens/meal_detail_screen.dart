import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  const MealDetailScreen({super.key}); 
  
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        // ignore: deprecated_member_use
        style: Theme.of(context).textTheme.headline6, // display the text
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey), // border color
        borderRadius: BorderRadius.circular(10), // border radius
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child, // display the child
    );
  }
 

  @override
  Widget build(BuildContext context) {
    final mealId =ModalRoute.of(context)!.settings.arguments as String; // get the meal id
    final selectedMeal=DUMMY_MEALS.firstWhere((meal) => meal.id == mealId); // get the meal id
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title), // display the meal id
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // ignore: sized_box_for_whitespace
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover), // display the image
            ),
            buildSectionTitle(context, 'Ingredients'), // display the text
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).hintColor, // display the card
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10), // padding
                    child: Text(' ${selectedMeal.ingredients[index]}'), // display the text
                  ),
                ),
                itemCount: selectedMeal.ingredients.length, // display the length
              ),
            ),
            buildSectionTitle(context, 'Steps'), // display the text
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar( // display the circle avatar
                        child: Text('# ${(index + 1)}'), // display the text
                      ),
                      title: Text(selectedMeal.steps[index]), // display the text
                    ),
                    const Divider(), // display the divider
                  ],
                ),
                itemCount: selectedMeal.steps.length, // display the length
              ),
            ),
          ],
        ),
      )
    );
  }
}
