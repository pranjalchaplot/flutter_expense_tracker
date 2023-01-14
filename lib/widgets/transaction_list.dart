import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/transaction_card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;
  const TransactionList(this._userTransaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ..._userTransaction.map((tx) {
          return TransactionCard(tx);
        })
      ],
    );
  }
}
