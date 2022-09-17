import 'package:flutter/material.dart';
import 'package:meal_app/providers/mealprovider.dart';
import 'package:meal_app/providers/themeprovider.dart';
import 'package:provider/provider.dart';
import '../models/meal.dart';
import '../widget/my_drawer.dart';
import './category_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = 'TabsScreen';



  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<String, dynamic>> _page = [
    {'page': CategoryScreen(), 'title': 'Category'},
    {'page': FavoritesScreen(), 'title': 'Favorite'}
  ];
  @override
  void initState() {
    super.initState();
    Provider.of<MealProvider>(context,listen: false).getDate();
    Provider.of<ThemeProvider>(context,listen: false).getThemeMode();
    Provider.of<ThemeProvider>(context,listen: false).getColor();

  }

  int _selectItem = 0;
  void onTapItem(int val) {
    setState(() {
      _selectItem = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_page[_selectItem]['title']),
      ),
      body: _page[_selectItem]['page'],
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapItem,
        currentIndex: _selectItem,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), label: 'Favorite'),
        ],
      ),
    );
  }
}
