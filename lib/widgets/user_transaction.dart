import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './new_transactions.dart';
import './transaction_list.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
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

  void addTransactions(String title, String amount) {
    final tx = Transaction(
      DateTime.now().toString(),
      title,
      double.parse(amount),
      DateTime.now(),
    );

    setState(() {
      _userTransaction.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addTransactions),
        TransactionList(_userTransaction),
      ],
    );
  }
}
