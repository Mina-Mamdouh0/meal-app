import 'package:flutter/material.dart';
import 'package:meal_app/providers/mealprovider.dart';
import 'package:provider/provider.dart';
import '../dummy_data.dart';
class MealDetailScreen extends StatelessWidget {

  static const routeName='MealDetailScreen';
  Widget buildTitle(BuildContext ctx,String text){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text,style: Theme.of(ctx).textTheme.headline6,),
    );
  }
  Widget buildContainer(Widget child){
    return Container(
      height: 150,
      width: 260,
      padding:EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey)
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    var accentColor= Theme.of(context).accentColor;
    final mealId=ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal=DUMMY_MEALS.firstWhere((meal) => mealId==meal.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(selectedMeal.imageUrl!,
                fit: BoxFit.cover,),
            ),
            buildTitle(context,'ingredients'),
            buildContainer(ListView.builder(
              itemBuilder: (context,index)=>Card(
                  color:accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    child: Text(selectedMeal.ingredients![index],
                      style:TextStyle(color:Colors.black) ,
                    ),
                  )
              ),
              itemCount: selectedMeal.ingredients!.length,),),
            buildTitle(context,'steps'),
            buildContainer(ListView.builder(
              itemBuilder: (context,index)=>Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index+1}'),
                    ),
                    title:Text(selectedMeal.steps![index],
                    style: TextStyle(color: Colors.black),) ,
                  ),
                  Divider(),
                ],
              ),

              itemCount: selectedMeal.steps!.length,),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Provider.of<MealProvider>(context,listen: false).toggleFavorite(mealId),
        child: Icon(
          Provider.of<MealProvider>(context,).isMealFavorite(mealId)?Icons.star:Icons.star_border,
        ),
      ),
    );
  }
}
