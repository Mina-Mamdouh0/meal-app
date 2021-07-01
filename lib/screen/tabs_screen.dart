import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widget/my_drawer.dart';
import './category_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = 'TabsScreen';
  final  List<Meal>favoriteMeal;

  TabsScreen(this.favoriteMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _page;
  @override

  void initState(){
    super.initState();
    _page = [
      {'page': CategoryScreen(), 'title': 'Category'},
      {'page': FavoritesScreen(widget.favoriteMeal), 'title': 'Favorite'}
    ];
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
              icon: Icon(Icons.category), title: Text('category')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Favorite')),
        ],
      ),
    );
  }
}
