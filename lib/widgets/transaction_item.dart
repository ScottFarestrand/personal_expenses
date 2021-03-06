import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          // style: Theme.of(context).textTheme.title,
        ),
        subtitle: MediaQuery.of(context).size.width >=420 ?
        Text(
            '${DateFormat.yMMMd().format(transaction.date)} - ${DateFormat.jm().format(transaction.date)}'
        ):
        Text(
            '${DateFormat.yMMMd().format(transaction.date)} '
        ),
        trailing: MediaQuery.of(context).size.width < 420 ?
        IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => deleteTx(transaction.id),
        ) :
        FlatButton.icon(
          onPressed: () => deleteTx(transaction.id),
          icon: Icon(Icons.delete),
          label: Text('Delete'),
          textColor: Theme.of(context).errorColor,),
        // ElevatedButton(
        //     onPressed: () => deleteTx(transactions[index].id),
        //     child: IconButton(
        //       icon: Icon(Icons.delete) ,
        //       color: Theme.of(context).errorColor,
        //     ),),
      ),
    );
  }
}