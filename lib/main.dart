import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/new_transactions.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showSwitch = false;

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

  void _removeTransaction(int toBeRemovedIndex) {
    setState(() {
      _userTransaction.removeAt(toBeRemovedIndex);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
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
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final appBar = AppBar(
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
    );
    final listWidget = SizedBox(
      height: (mediaQuery.size.height -
              mediaQuery.padding.top -
              appBar.preferredSize.height) *
          0.8,
      child: TransactionList(_userTransaction, _removeTransaction),
    );
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          fontFamily: 'Quicksand',
          errorColor: Colors.red,
          textTheme: ThemeData.light().textTheme.copyWith(
                  button: const TextStyle(
                color: Colors.white,
              ))),
      home: Scaffold(
        appBar: appBar,
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
              if (isLandscape)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Show Chart'),
                    Switch(
                        value: _showSwitch,
                        onChanged: (val) {
                          setState(() {
                            _showSwitch = val;
                          });
                        }),
                  ],
                ),
              if (!isLandscape)
                SizedBox(
                  height: (mediaQuery.size.height -
                          mediaQuery.padding.top -
                          appBar.preferredSize.height) *
                      0.2,
                  child: Chart(_recentTransactions),
                ),
              if (!isLandscape) listWidget,
              if (isLandscape)
                _showSwitch
                    ? SizedBox(
                        height: (mediaQuery.size.height -
                                mediaQuery.padding.top -
                                appBar.preferredSize.height) *
                            0.7,
                        child: Chart(_recentTransactions),
                      )
                    : listWidget,
            ],
          ),
        ),
      ),
    );
  }
}
