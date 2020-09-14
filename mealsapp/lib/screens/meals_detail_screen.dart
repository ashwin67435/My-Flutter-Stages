import 'package:flutter/material.dart';
import '../data/dummyCategories.dart';

class MealsDetailScreen extends StatelessWidget {
  static const routePath = "/meals_detail_screen";
  final Function toggleFavorite;
  final Function isFavorite;
  MealsDetailScreen(this.isFavorite,this.toggleFavorite);

  Widget buildSectionTitle(BuildContext ctx, String title) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.title,
      ),
    );
  }

  Widget buildContanierStyle(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      height: 150,
      width: 380,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeals =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${selectedMeals.title}',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeals.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContanierStyle(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      child: Text("=> "+selectedMeals.ingredients[index],style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  );
                },
                itemCount: selectedMeals.ingredients.length,
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildContanierStyle(
              context,
              ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('#${index+1}'),
                      backgroundColor: Colors.purple,
                    ),
                    title: Text(selectedMeals.steps[index]),
                  );
                },
                itemCount: selectedMeals.steps.length,
              ),
            ),
            Divider(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.favorite : Icons.favorite_border,
        ),
        onPressed: ()=>toggleFavorite(mealId),
      ),
    );
  }
}
