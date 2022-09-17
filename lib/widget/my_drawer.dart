import 'package:flutter/material.dart';
import 'package:meal_app/screen/themescreen.dart';
import '../screen/filter_screen.dart';
import '../screen/tabs_screen.dart';
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String title,IconData icon,Function() onSelectTap,BuildContext ctx){
return ListTile(
  title: Text(title,style:
  TextStyle(
      color: Theme.of(ctx).textTheme.headline6!.color,
      fontSize: 24,
      fontFamily: 'RobotoCondensed',
      fontWeight: FontWeight.bold
  )),
  leading: Icon(icon,size: 26,color: Theme.of(ctx).buttonColor,),
  onTap: onSelectTap,
);
    }
    return Drawer(
      elevation: 0.0,
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
          },context),
          buildListTile('Filter',Icons.settings,(){
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          },context),
          buildListTile('Theme',Icons.color_lens,(){
            Navigator.of(context).pushReplacementNamed(ThemeScreen.routeName);
          },context),
        ],
      ),
    );
  }
}
