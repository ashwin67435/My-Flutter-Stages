import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 28,
        ),
      ),
      leading: Icon(
        icon,
        size: 30,
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 230,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            alignment: Alignment.center,
            child: Text(
              'Cooking\nToolBar',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            (){
              Navigator.of(context).pushReplacementNamed('/');
            }
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            'Filters',
            Icons.filter_list,
            (){
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routePath);
            }
          ),
        ],
      ),
    );
  }
}
