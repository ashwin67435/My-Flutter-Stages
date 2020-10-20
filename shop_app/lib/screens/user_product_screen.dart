import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/user_product_item.dart';
import '../widgets/app_drawer.dart';
import '../screens/edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {
  static const routePath = '/user-product-screen';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [IconButton(icon: const Icon(Icons.add), onPressed: () {
          Navigator.of(context).pushNamed(EditProductScreen.routePath);
        })],
      ),
      drawer: AppDrawer(),
      body: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView.builder(itemCount: productsData.items.length,itemBuilder: (context,index){
            return Column(
              children: [
                UserProductItem(productsData.items[index].id,productsData.items[index].title, productsData.items[index].imageUrl),
                Divider(),
              ],
            );
          })),
    );
  }
}
