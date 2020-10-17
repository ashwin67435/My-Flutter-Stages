import 'package:flutter/material.dart';
import '../widgets/badge.dart';
import '../widgets/product_grid.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../screens/cart_screen.dart';
import '../widgets/app_drawer.dart';


enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var showFavoriteOnly = false;
  @override
  Widget build(BuildContext context) {
    // final productContainer = Provider.of<Products>(context,listen: false);
    // final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  // productContainer.showFavoriteOnly();
                  showFavoriteOnly = true;
                } else {
                  showFavoriteOnly = false;
                  // productContainer.showAll();
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
              Navigator.of(context).pushNamed(
                CartScreen.routePath,
              );
            }),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductGrid(showFavoriteOnly),
    );
  }
}
