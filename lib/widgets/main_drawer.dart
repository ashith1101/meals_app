import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile({
    required String title,
    required IconData icon,
    required Function tapHandler,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(title, 
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => tapHandler(),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).hintColor,
          child: const Text(
            'Cooking Up!',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 20,),
        buildListTile(
          title: 'Meals', 
          icon: Icons.restaurant,
          tapHandler: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        buildListTile(
          title: 'Filters', 
          icon: Icons.settings,
          tapHandler: () {
            Navigator.of(context).pushReplacementNamed('/filters');
          },
        ),
      ],),
    );
  }

}