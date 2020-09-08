import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meals_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          // ignore: deprecated_member_use
          body1:TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          body2:TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/':(ctx) => CategoriesScreen(),
        CategoryMealsScreen.routePath:(ctx) => CategoryMealsScreen(),
        MealsDetailScreen.routePath:(ctx) => MealsDetailScreen(),
      },

    
    );
  }
}

