import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionListLandscape extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionListLandscape(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).orientation);
    if (transactions.isEmpty) {
      print('emtpy');
    } else {
      print('Not Empty');
    }
    return Container(
      height: MediaQuery.of(context).size.height * .5,
      child: transactions.isEmpty
          ? Column(
        children: <Widget>[
          Text(
            'No transactions added yet!',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 200,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              )),
        ],
      ):
      GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 450,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemBuilder: (context, index){
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal:  5),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: FittedBox(
                        child: Text('\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 13),)
                    ),
                  ),
                ),
                trailing:
                IconButton(icon: Icon(Icons.delete), color: Theme.of(context).errorColor,
                    // onPressed: () => deleteTransaction(transactions[index].id),
                    onPressed: (){
                      deleteTransaction(transactions[index].id);
                    }
                ),
                title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.titleMedium),
                subtitle: Text(
                  DateFormat.yMMMMd().format(transactions[index].date),
                ),
              ),
            );
          }),
    );
  }
}
