import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';
import './models/transaction.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          secondaryHeaderColor: Colors.amber,
          buttonTheme: ButtonThemeData(buttonColor: Colors.purple, textTheme: ButtonTextTheme.primary),
          // accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String titleInput;
  String amountInput;
  // final List<Transaction> _userTransactions = [];
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 92.89,
      date: DateTime.now().subtract(Duration(days: 0)),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 40.0,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: 't3',
      title: 'Tires',
      amount: 30.00,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Transaction(
      id: 't4',
      title: 'Clothes',
      amount: 20.00,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: 't5',
      title: 'Gym Dues',
      amount: 10.00,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: 't6',
      title: 'Coffee',
      amount: 50.0,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    Transaction(
      id: 't7',
      title: 'Dining out',
      amount: 50.00,
      date: DateTime.now().subtract(Duration(days: 6)),
    ),
    Transaction(
      id: 't8',
      title: 'Gas',
      amount: 50.00,
      date: DateTime.now().subtract(Duration(days: 7  )),
    ),
  ];

  // List<Transaction> get _recentTransactions {
  //   return _userTransactions.where((tx) {
  //     return tx.date.isAfter(
  //       DateTime.now().subtract(
  //         Duration(days: 7),
  //       ),
  //     );
  //   }).toList();
  // }
  void _deleteTransaction(String id) {
    setState(() {
      print('deleting ID $id');
      _userTransactions.removeWhere((tx) => tx.id == id);

    });

  }
  void _addNewTransaction(String txTitle, double txAmount, DateTime txDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: txDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: _userTransactions.isEmpty ? Text('Empty') : Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_userTransactions),
            TransactionList(_userTransactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
