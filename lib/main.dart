import 'package:expense_tracker/transaction_card.dart';
import 'package:flutter/material.dart';

import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Transaction> transactions = [
    Transaction(
      't1',
      'Food',
      200,
      DateTime.now(),
    ),
    Transaction(
      't2',
      'Nothing Phone (1)',
      200,
      DateTime.now(),
    ),
  ];

  dynamic titleInput;
  dynamic amountInput;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Expense Tracker')),
        body: Column(
          children: [
            const Card(
              color: Colors.blue,
              child: SizedBox(
                width: 100,
                child: Text('Char!'),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      onChanged: (value) => titleInput = value,
                      decoration: const InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      onChanged: (value) => amountInput = value,
                      decoration: const InputDecoration(labelText: 'Amount'),
                    ),
                    TextButton(
                      onPressed: () {
                        // transactions.add(
                        //   Transaction(
                        //     't3',
                        //     titleInput,
                        //     amountInput,
                        //     DateTime.now(),
                        //   ),
                        // );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.orange,
                      ),
                      child: const Text('Add Transaction'),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                ...transactions.map((tx) {
                  return TransactionCard(tx);
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
