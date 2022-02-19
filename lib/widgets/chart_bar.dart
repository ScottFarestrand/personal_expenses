

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  // const ChartBar({Key? key}) : super(key: key);
  final String label;
  final double amount;
  final double pctOfTotal;

  ChartBar(this.label, this.amount, this.pctOfTotal);
  // ChartBar(this.label, this.amount);
  @override
  Widget build(BuildContext context) {
    print(pctOfTotal);
    return Column(
      children: [
        Container(
          height:  20,
          child: FittedBox(
              child: Text('\$${amount.toStringAsFixed(0)}')),
        ),
        SizedBox(height: 4),
        Container(
          height: 60,
          width: 15,
          child: Stack(
            children: [Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1),
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: pctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 4,),
        Text(label),
      ],
    );
  }
}
