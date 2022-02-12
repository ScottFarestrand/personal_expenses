import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';


class Chart extends StatelessWidget {
  // const ({Key? key}) : super(key: key);
   List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String, Object>> get WeeklyTransactions{
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: 0),);
      var dailyTotal = 0.0;
      for (var i = 0; i < recentTransactions.length; i++){
        if (
        DateFormat.E(recentTransactions[i].date) == DateFormat.E(weekDay))
          {
            dailyTotal +=recentTransactions[i].amount;
          }
        }
      print(DateFormat.E(weekDay));
      print(dailyTotal);
      return {'day': DateFormat.E(weekDay), 'amount': dailyTotal,};
      });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
    elevation: 6,
    margin: EdgeInsets.all(20),
    child: Row(children: [
      Column(children: [],),
],),
    );
  }
}
