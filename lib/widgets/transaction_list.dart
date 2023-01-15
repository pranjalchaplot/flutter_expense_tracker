import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/transaction_card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;
  const TransactionList(this._userTransaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: ListView.builder(
        itemBuilder: ((context, index) =>
            TransactionCard(_userTransaction[index])),
        itemCount: _userTransaction.length,
      ),
    );
  }
}
