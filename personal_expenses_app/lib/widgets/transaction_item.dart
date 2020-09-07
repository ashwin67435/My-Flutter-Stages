import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  final transaction;
  final deleteTx;
  const TransactionItem({Key key,this.transaction,this.deleteTx}):super(key:key);
  @override
  _TransactionItemState createState() => _TransactionItemState();
}


class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;
  @override
  void initState() {
    // TODO: implement initState
    const avatarColor = [
      Colors.red,
      Colors.blue,
      Colors.black,
      Colors.yellow,
    ];
    _bgColor = avatarColor[Random().nextInt(4)];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 7,
                  child: ListTile(
                    title: Text(
                      '${widget.transaction.title}',
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      '${DateFormat.yMMMd().format(widget.transaction.date)}',
                    ),
                    leading: CircleAvatar(
                      backgroundColor: _bgColor,
                      child: FittedBox(
                        child: Text('\$${widget.transaction.cost}'),
                      ),
                      radius: 30,
                    ),
                    trailing: MediaQuery.of(context).size.width > 460
                        ? FlatButton.icon(
                            onPressed: ()=>widget.deleteTx(widget.transaction.id),
                            icon: Icon(Icons.delete),
                            label: Text('Delete'),
                            textColor: Theme.of(context).errorColor,
                          )
                        : IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Theme.of(context).errorColor,
                            ),
                            onPressed: () =>
                                widget.deleteTx(widget.transaction.id),
                          ),
                  ),
                );
  }
}