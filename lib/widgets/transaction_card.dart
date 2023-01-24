import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionCard extends StatefulWidget {
  final Transaction transaction;
  final String transactionID;
  final Function removeTx;
  const TransactionCard({
    super.key,
    required this.transaction,
    required this.transactionID,
    required this.removeTx,
  }); // using super.key to forward the key value to statefulwidget

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  Color _bgColor = Colors.white;

  @override
  void initState() {
    super.initState();
    const availableColors = [
      Colors.black,
      Colors.blue,
      Colors.green,
      Colors.orange,
    ];
    _bgColor = availableColors[Random().nextInt(4)];
  }

  @override
  Widget build(BuildContext context) {
    final double pageWidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Text(
                '\$${widget.transaction.amount.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: pageWidth < 460
            ? IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () {
                  widget.removeTx(widget.transactionID);
                },
              )
            : TextButton.icon(
                icon: Icon(Icons.delete, color: Theme.of(context).errorColor),
                onPressed: () {
                  widget.removeTx(widget.transactionID);
                },
                label: Text(
                  'Delete',
                  style: TextStyle(
                    color: Theme.of(context).errorColor,
                  ),
                ),
              ),
      ),
    );
  }
}
