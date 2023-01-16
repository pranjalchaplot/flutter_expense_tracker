import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      var totalSum = 0.0;

      for (var transactionIndex = 0;
          transactionIndex < recentTransactions.length;
          transactionIndex++) {
        DateTime currentTransaction = recentTransactions[transactionIndex].date;
        if (currentTransaction.day == weekDay.day &&
            currentTransaction.month == weekDay.month &&
            currentTransaction.year == weekDay.year) {
          totalSum += recentTransactions[transactionIndex].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  const Chart(this.recentTransactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...groupedTransactionValues.map((item) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                item['day'].toString(),
                (item['amount'] as double),
                totalSpending != 0.0
                    ? ((item['amount'] as double) / totalSpending)
                    : 0.0,
              ),
            );
          })
        ],
      ),
    );
  }
}
