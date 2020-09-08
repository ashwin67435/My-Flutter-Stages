import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../data/dummyCategories.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routePath = '/category-meals-screen';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
            id:categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
          );
        },
      ),
    );
  }
}
