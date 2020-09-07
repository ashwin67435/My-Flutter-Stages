import 'package:flutter/material.dart';
import 'package:mealsapp/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  CategoryItem({this.title, this.color,this.id});

  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
        CategoryMealsScreen.routePath,arguments: {'id':id,'title':title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ()=>selectCategory(context),
        child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.title,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
