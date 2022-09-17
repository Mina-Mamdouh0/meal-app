


import 'package:flutter/material.dart';
import 'package:meal_app/providers/themeprovider.dart';
import 'package:meal_app/widget/my_drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
class ThemeScreen extends StatelessWidget {
  static const routeName = 'ThemeScreen';

  Widget buildRadioListTile(
      String title,
      IconData? icon,
      BuildContext ctx,
      ThemeMode themeVal,) {
    return RadioListTile(
      secondary:Icon(icon,color: Theme.of(ctx).buttonColor,) ,
      title: Text(title),
      value: themeVal,
      groupValue: Provider.of<ThemeProvider>(ctx).themeMode,
      onChanged: (newThemeVal)=>Provider.of<ThemeProvider>(ctx,listen: false).themeModeChange(newThemeVal),


    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Themes'),

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
                Text('Choose your Themes Mode',style: Theme.of(context).textTheme.headline6,),
                buildRadioListTile('System Default Theme',null,context,ThemeMode.system),
                buildRadioListTile('Light Theme',Icons.wb_sunny_outlined,context,ThemeMode.light),
                buildRadioListTile('Dark Theme',Icons.nightlight_round,context,ThemeMode.dark),
                buildListTile(context,'primary'),
                buildListTile(context,'accent'),
              ],
            ),
          )
        ],
      ),
      drawer: MyDrawer(),
    );
  }
  ListTile buildListTile(BuildContext ctx,String name){
    var primaryColor=Provider.of<ThemeProvider>(ctx).primaryColor;
    var accentColor=Provider.of<ThemeProvider>(ctx).accentColor;

    return ListTile(
      title:  Text('Choose your $name color',
      style:Theme.of(ctx).textTheme.headline6,),
      trailing: CircleAvatar(
        backgroundColor: name=='primary'?primaryColor:accentColor,
      ),
      onTap: (){
        showDialog(context: ctx,
            builder: (ctx){
          return AlertDialog(
            elevation: 4,
            titlePadding: EdgeInsets.all(0.0),
            contentPadding: EdgeInsets.all(0.0),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor:name=='primary'?
                Provider.of<ThemeProvider>(ctx).primaryColor:Provider.of<ThemeProvider>(ctx).accentColor,
                onColorChanged: (newColor)=>Provider.of<ThemeProvider>(ctx,listen: false).onChange(newColor,name=='primary'?1:2 ),
              colorPickerWidth: 300.0,
                pickerAreaHeightPercent: 0.7,
                displayThumbColor: true,
                showLabel: false,
              ),
            ),
          );
            });
      },

    );
  }
}
