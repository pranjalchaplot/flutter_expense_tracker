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
      child: _userTransaction.isEmpty
          ? Column(
              children: [
                const Text(
                  'No Transaction Available',
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  //wrapped in container because img parent(column takes infinite height)
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: ((context, index) =>
                  TransactionCard(_userTransaction[index])),
              itemCount: _userTransaction.length,
            ),
    );
  }
}
