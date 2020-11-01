import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrderScreen extends StatefulWidget {
  static const routePath = '/order_screen';

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  Future _ordersFuture;
  Future _obtainOrdersFuture() {
    return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  void initState() {
    _ordersFuture = _obtainOrdersFuture();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Orders'),
        ),
        body: FutureBuilder(
          future:
              _ordersFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.error != null) {
                return Center(
                  child: Text('An error Occurred!'),
                );
              } else {
                return Consumer<Orders>(
                  builder: (context, orderData, child) {
                    return ListView.builder(
                      itemCount: orderData.orders.length,
                      itemBuilder: (context, index) {
                        return OrderItem(orderData.orders[index]);
                      },
                    );
                  },
                );
              }
            }
          },
        ));
  }
}
