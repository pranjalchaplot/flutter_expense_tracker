import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  final int transactionIndex;
  final Function removeTx;
  const TransactionCard(this.transaction, this.transactionIndex, this.removeTx,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5.0,
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 5,
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Text(
                  '\$${transaction.amount.toStringAsFixed(2)}',
                ),
              ),
            ),
          ),
          title: Text(
            transaction.title,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          subtitle: Text(
            DateFormat.yMMMd().format(transaction.date),
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            color: Theme.of(context).errorColor,
            onPressed: () {
              removeTx(transactionIndex);
            },
          ),
        )
        // Row(
        //   children: [
        //     Container(
        //       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        //       padding: const EdgeInsets.all(8),
        //       decoration: BoxDecoration(
        //           border: Border.all(
        //             color: Colors.black,
        //             width: 2,
        //           ),
        //           borderRadius: BorderRadius.circular(10)),
        //       child: Text(
        //         '\$${transaction.amount.toStringAsFixed(2)}',
        //         style: const TextStyle(
        //           fontWeight: FontWeight.bold,
        //           fontSize: 17,
        //         ),
        //       ),
        //     ),
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           transaction.title,
        //           style: const TextStyle(
        //             color: Colors.red,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 15,
        //           ),
        //         ),
        //         Text(
        //           DateFormat.yMMMd().format(transaction.date),
        //           style: const TextStyle(
        //             color: Colors.grey,
        //           ),
        //         ),
        //       ],
        //     )
        //   ],
        // )
        );
  }
}
