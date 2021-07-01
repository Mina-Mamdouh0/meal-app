import 'package:flutter/material.dart';
import '../screen/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;

  const MealItem({
    @required this.id,
    @required this.imageUrl,
    @required this.title,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,
  });

  String get complex {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Known';
    }
  }

  String get afford {
    switch (affordability) {
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Known';
    }
  }

  void onSelect(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,
        arguments: id).then((result){
          if(result !=null ){
            //remove(result);
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelect(context),
      child: Card(
        margin: EdgeInsets.all(12.0),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 300,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                      width: 220,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      color: Colors.black54,
                      child: Text(
                        title,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      )),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_alarm),
                      SizedBox(
                        width: 10,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 10,
                      ),
                      Text('$complex')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 10,
                      ),
                      Text('$afford ')
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
