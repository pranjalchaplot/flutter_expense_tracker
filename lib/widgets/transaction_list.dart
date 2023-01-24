import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;
  final Function removeTx;
  const TransactionList(this._userTransaction, this.removeTx, {super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return SizedBox(
        height: 550,
        child: _userTransaction.isEmpty
            ? LayoutBuilder(builder: (context, constraints) {
                return Column(
                  children: [
                    const Text(
                      'No Transaction Available',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      //wrapped in container because img parent(column takes infinite height)
                      height: constraints.maxHeight * 0.7,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              })
            : ListView(
                children: [
                  ..._userTransaction
                      .map(
                        (tx) => TransactionCard(
                          key: ValueKey(tx.id),
                          transaction: tx,
                          transactionID: tx.id,
                          removeTx: removeTx,
                        ),
                      )
                      .toList(),
                ],
              )
        //  ListView.builder(
        //     itemBuilder: ((context, index) =>
        //     itemCount: _userTransaction.length,
        //   ),
        );
  }
}
