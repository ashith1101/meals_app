import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favourites_screen.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favouriteMeals;

  const TabsScreen(this.favouriteMeals, {Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>>? _pages;
  int _selectedPageIndex = 0;

  @override
  initState() {
    _pages=[
    // ignore: prefer_const_constructors
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavouritesScreen(widget.favouriteMeals), 'title': 'Your Favourites'},
  ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages?[_selectedPageIndex]['title'] as String),
        ),
        drawer: const MainDrawer(),
        body: _pages?[_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).hintColor,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favourites',
            ),
          ],
        ),
      ),
    );
  }
}
