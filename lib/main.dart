import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/new_transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _userTransaction = [
    // Transaction(
    //   't1',
    //   'Food',
    //   200,
    //   DateTime.now(),
    // ),
    // Transaction(
    //   't2',
    //   'Nothing Phone (1)',
    //   200,
    //   DateTime.now(),
    // ),
  ];

  void _addTransactions(String title, double amount, DateTime date) {
    final tx = Transaction(
      DateTime.now().toString(),
      title,
      amount,
      date,
    );

    setState(() {
      _userTransaction.add(tx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addTransactions),
        );
      },
    );
  }

  List<Transaction> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                  button: TextStyle(
                color: Colors.white,
              ))),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
          actions: [
            Builder(
              builder: (ctx) => IconButton(
                onPressed: () => _startAddNewTransaction(ctx),
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(
          builder: (ctx) => FloatingActionButton(
            onPressed: () => _startAddNewTransaction(ctx),
            child: const Icon(Icons.add),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Chart(_recentTransactions),
              TransactionList(_userTransaction),
            ],
          ),
        ),
      ),
    );
  }
}
