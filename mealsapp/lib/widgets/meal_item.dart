import 'package:flutter/material.dart';
import '../models/meals.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.title,
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
    @required this.imageUrl,
  });

  String get complexityText {
    switch (complexity){
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
        return 'Unknown';
    }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              child: Image.network(
                imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: Container(
                width: 330,
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                color: Colors.black38,
                child: Text(
                  title,
                  softWrap: true,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Row(children: [
               Icon(Icons.schedule),
               SizedBox(width: 6,),
               Text('$duration min',style: TextStyle(fontWeight: FontWeight.bold,),),
             ],),
              Row(children: [
               Icon(Icons.work),
               SizedBox(width: 6,),
               Text('$complexityText',style: TextStyle(fontWeight: FontWeight.bold,),),
             ],),
            ],),
          )
        ]),
      ),
    );
  }
}
