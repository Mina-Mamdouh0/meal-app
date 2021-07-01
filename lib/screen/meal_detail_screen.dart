import 'package:flutter/material.dart';
import '../dummy_data.dart';
class MealDetailScreen extends StatelessWidget {
  final Function toggleFavorite;
  final Function isMealFavorite;
  static const routeName='MealDetailScreen';

   MealDetailScreen(this.toggleFavorite,this.isMealFavorite);
  Widget buildTitle(BuildContext ctx,String text){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text,style: Theme.of(ctx).textTheme.title,),
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
    final mealId=ModalRoute.of(context).settings.arguments as String;
    final selectedMeal=DUMMY_MEALS.firstWhere((meal) => mealId==meal.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(selectedMeal.imageUrl,
                fit: BoxFit.cover,),
            ),
            buildTitle(context,'ingredients'),
            buildContainer(ListView.builder(
              itemBuilder: (context,index)=>Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  )
              ),
              itemCount: selectedMeal.ingredients.length,),),
            buildTitle(context,'steps'),
            buildContainer(ListView.builder(
              itemBuilder: (context,index)=>Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index+1}'),
                    ),
                    title:Text(selectedMeal.steps[index]) ,
                  ),
                  Divider(),
                ],
              ),

              itemCount: selectedMeal.steps.length,),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>toggleFavorite(mealId),
        child: Icon(
          isMealFavorite(mealId)?Icons.star:Icons.star_border,
        ),
      ),
    );
  }
}
