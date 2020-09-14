import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meals.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routePath = '/category-meals-screen';  
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String  categoryTitle;
  List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals
        .where((element) => element.categories.contains(categoryId))
        .toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState(() {
        displayedMeals.removeWhere((element) => element.id==mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: displayedMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
            id:displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
          );
        },
      ),
    );
  }
}
