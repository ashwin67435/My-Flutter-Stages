import 'package:flutter/material.dart';
import '../widgets/product_item.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductGrid extends StatelessWidget {
  final bool showFav;
  ProductGrid(this.showFav);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFav? productsData.favoriteItems: productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
          // create: (context) => products[index],
          value: products[index],
          child: ProductItem(
          // products[index].id,
          // products[index].imageUrl,
          // products[index].title,
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
