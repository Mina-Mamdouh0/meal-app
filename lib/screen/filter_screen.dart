import 'package:flutter/material.dart';
import 'package:meal_app/providers/mealprovider.dart';
import 'package:meal_app/providers/themeprovider.dart';
import 'package:provider/provider.dart';
import '../widget/my_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'FilterScreen';



  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  Widget buildSwitchListTile(
      String title, String subTitle, bool isValue, Function(bool) upDateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: isValue,
      onChanged: upDateValue,
      inactiveTrackColor: Provider.of<ThemeProvider>(context).themeMode==ThemeMode.light?
      null:Colors.black,

    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, bool> _filters=Provider.of<MealProvider>(context).filters;
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),

      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    'GlutenFree',
                    'Only include gluten-free meals.',
                    _filters['gluten']!,
                        (newValue) {
                  setState(() {
                    _filters['gluten'] = newValue;
                  });
                  Provider.of<MealProvider>(context,listen: false).setFilters();
                }),
                buildSwitchListTile(
                    'LactoseFree',
                    'Only include lactose-free meals.',
                    _filters['lactose']!, (newValue) {
                  setState(() {
                    _filters['lactose'] = newValue;
                  });
                  Provider.of<MealProvider>(context,listen: false).setFilters();
                }),
                buildSwitchListTile(
                    'Vegetarian',
                    'Only include vegetarian meals.',
                    _filters['vegetarian']!, (newValue) {
                  setState(() {
                    _filters['vegetarian'] = newValue;
                  });
                  Provider.of<MealProvider>(context,listen: false).setFilters();
                }),
                buildSwitchListTile(
                    'Vegan', 'Only include vegan meals.', _filters['vegan']!, (newValue) {
                  setState(() {
                    _filters['vegan'] = newValue;
                  });
                  Provider.of<MealProvider>(context,listen: false).setFilters();
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
