import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:personal_expenses_app/widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          errorColor: Colors.red,
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                button: TextStyle(
                  color: Colors.white,
                ),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      cost: 89.98,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Brought Iphone',
      cost: 58.56,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't13',
      title: 'New books',
      cost: 89.98,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't21',
      title: 'Brought macbook',
      cost: 58.56,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'New Shower',
      cost: 89.98,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Brought Ipod',
      cost: 58.56,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'New Showcase',
      cost: 89.98,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Brought Ipad',
      cost: 58.56,
      date: DateTime.now(),
    ),
  ];

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) => GestureDetector(
              child: NewTransaction(_addNewTransaction),
              onTap: () {},
              behavior: HitTestBehavior.opaque,
            ));
  }

  void _addNewTransaction(String txtitle, double txamount, DateTime txDate) {
    final newTx = Transaction(
      title: txtitle,
      cost: txamount,
      date: txDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  List<Transaction> get _recentTransaction {
    return _userTransactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((instance) => instance.id == id);
    });
  }

  bool _showChart = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final isLandScape = mediaQuery.orientation == Orientation.landscape;

    Widget _cupertinoNavigationBar(){
        return CupertinoNavigationBar(
                    middle: Text('Personal Expenses'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      GestureDetector(
                        child: Icon(CupertinoIcons.add),
                        onTap: () => _startNewTransaction(context),
                      ),
                    ],),
                  );
    }

    Widget _scafoldAppBar(){
      return AppBar(
            title: Text('Personal Expenses'),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  _startNewTransaction(context);
                },
              ),
            ],
          );
    }
    
    final PreferredSizeWidget appBar = Platform.isIOS
        ? _cupertinoNavigationBar()
        : _scafoldAppBar();
        

    final txListWidget = Container(
      child: TransactionList(_userTransactions, _deleteTransaction),
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.7,
    );

    final bodyWidget = SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isLandScape)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Show Chart'),
                Switch(
                  value: _showChart,
                  onChanged: (val) {
                    setState(() {
                      _showChart = val;
                    });
                  },
                )
              ],
            ),
          if (!isLandScape)
            Container(
              child: Chart(_recentTransaction),
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.3,
            ),
          if (!isLandScape) txListWidget,
          if (isLandScape)
            _showChart
                ? Container(
                    child: Chart(_recentTransaction),
                    height: (mediaQuery.size.height -
                            appBar.preferredSize.height -
                            mediaQuery.padding.top) *
                        0.7,
                  )
                : txListWidget,
        ],
      ),
    );

  Widget _buildScafoldwidget(){
    return Scaffold(
            appBar: appBar,
            body: bodyWidget,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      _startNewTransaction(context);
                    },
                  ),
          );
  } 

    Widget _buildCurpertinoWidget(){

        return CupertinoPageScaffold(
            child: bodyWidget,
            navigationBar: appBar,
          );

    }
    return Platform.isIOS
        ? _buildCurpertinoWidget()
        : _buildScafoldwidget();
  }
}
