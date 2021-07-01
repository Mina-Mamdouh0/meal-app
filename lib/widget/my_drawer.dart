import 'package:flutter/material.dart';
import '../screen/filter_screen.dart';
import '../screen/tabs_screen.dart';
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String title,IconData icon,Function onSelectTap){
return ListTile(
  title: Text(title,style:
  TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontFamily: 'RobotoCondensed',
      fontWeight: FontWeight.bold
  )),
  leading: Icon(icon,size: 26,),
  onTap: onSelectTap,
);
    }
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('Cooking Up !',style:
              TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              )),
          ),
          SizedBox(height: 10,),
          buildListTile('Meal',Icons.restaurant,(){
            Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
          }),
          buildListTile('Filter',Icons.settings,(){
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
