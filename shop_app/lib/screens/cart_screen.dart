import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static final routePath = '/cart_screen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).primaryTextTheme.title.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  OrderButtonState(cart: cart),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (context, index) {
                return CartItem(
                  cart.items.values.toList()[index].id,
                  cart.items.values.toList()[index].price,
                  cart.items.values.toList()[index].quantity,
                  cart.items.values.toList()[index].title,
                  cart.items.keys.toList()[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OrderButtonState extends StatefulWidget {
  const OrderButtonState({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _OrderButtonStateState createState() => _OrderButtonStateState();
}

class _OrderButtonStateState extends State<OrderButtonState> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (widget.cart.totalAmount<=0 || _isLoading) ? null : () async {
        setState(() {
          _isLoading = true;
        });
        await Provider.of<Orders>(context,listen: false).addOrder(
          widget.cart.items.values.toList(),
          widget.cart.totalAmount,
        );
        setState(() {
          _isLoading = false;
        });
        widget.cart.clear();
      },
      child: _isLoading ? CircularProgressIndicator() : Text(
        'ORDER NOW',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
