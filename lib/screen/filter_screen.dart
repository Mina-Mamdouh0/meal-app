import 'package:flutter/material.dart';
import '../widget/my_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'FilterScreen';
  final Function _saveFilter;
  final Map<String, bool> _filters;

  const FilterScreen(this._filters,this._saveFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree=false;
  bool _isVegan=false ;
  bool _isVegetarian =false;
  bool _isLactoseFree=false;

  @override
  initState(){
    _isGlutenFree=widget._filters['gluten'] ;
    _isVegan =widget._filters['vegan'];
    _isVegetarian =widget._filters['vegetarian'];
     _isLactoseFree=widget._filters['lactose'];
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subTitle, bool isValue, Function upDateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: isValue,
      onChanged: upDateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Map<String, bool> _filters = {
                  'gluten': _isGlutenFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian,
                  'lactose': _isLactoseFree,
                };
                widget._saveFilter(_filters);
              }),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    'GlutenFree',
                    'Only include gluten-free meals.',
                    _isGlutenFree, (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                }),
                buildSwitchListTile(
                    'LactoseFree',
                    'Only include lactose-free meals.',
                    _isLactoseFree, (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Vegetarian',
                    'Only include vegetarian meals.',
                    _isVegetarian, (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Vegan', 'Only include vegan meals.', _isVegan, (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
