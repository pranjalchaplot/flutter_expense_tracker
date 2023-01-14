import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/transaction_card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;
  const TransactionList(this._userTransaction, {super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Container(
      height: 450,
      child: ListView.builder(
        itemBuilder: ((context, index) =>
            TransactionCard(_userTransaction[index])),
        itemCount: _userTransaction.length,
      ),
=======
    return Column(
      children: [
        ..._userTransaction.map((tx) {
          return TransactionCard(tx);
        })
      ],
>>>>>>> fb5e971b2d0dad84c2a1ed3d2ed984e2c52a6487
    );
  }
}
