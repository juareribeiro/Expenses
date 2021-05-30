import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      final weekDayFormatted = DateFormat("yyyy-MM-dd").format(weekDay);

      double totalSum = 0.0;
      for (var item in recentTransaction) {
        final itemFormatted = DateFormat("yyyy-MM-dd").format(item.date);
        bool sameDate = itemFormatted == weekDayFormatted;

        if (sameDate) totalSum += item.value;
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactions.map((transaction) {
          return ChartBar(
            label: transaction['day'],
            value: transaction['value'],
            percentage: 0.5,
          );
        }).toList(),
      ),
    );
  }
}
