import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _newTransactionDate ;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    final transactionDate = _newTransactionDate;
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    if (_newTransactionDate == null){
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      transactionDate,

    );

    Navigator.of(context).pop();
  }

  void _presentDataPicker(){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 45)),
        lastDate: DateTime.now()
    ).then((value) {
      if ( value == null){
        return;
      }
      setState(() {
        _newTransactionDate = value;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text(_newTransactionDate ==  null
                      ? 'No Date Chosen'
                      : DateFormat.yMd().format(_newTransactionDate),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                      onPressed: _presentDataPicker,
                      child: Text('Choose Date', style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add Transaction',),
             color: Theme.of(context).primaryColor,
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
