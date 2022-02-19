import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'chart_bar.dart';


class Chart extends StatelessWidget {
  // const ({Key? key}) : super(key: key);
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String, Object>> get groupedTransactions{
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index),);
      var dailyTotal = 0.0;
      for (var i = 0; i < recentTransactions.length; i++){
        if (
        recentTransactions[i].date.year == weekDay.year &&
              recentTransactions[i].date.month == weekDay.month &&
              recentTransactions[i].date.day == weekDay.day
            )
          {
            dailyTotal +=recentTransactions[i].amount;
          }
        }
      return {'day': DateFormat.E().format(weekDay), 'amount': dailyTotal,};
      }).reversed.toList();
  }

  double get weeklyTotal {
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }


  @override
  Widget build(BuildContext context) {

    return Card(
    elevation: 6,
    margin: EdgeInsets.all(20),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactions.map((tx) {
        // return  Text('${tx['day'] : ${tx['amount'].toString()}'');
        // return Text('${tx['day']} : ${tx['amount'].toString()}');
        // return ChartBar(tx['day'], tx['amount']);

        return Flexible(
          fit: FlexFit.tight,
            child: ChartBar(tx['day'], tx['amount'], (tx['amount'] as double)  / weeklyTotal));
      }).toList(),),
    ),
    );
  }
}
