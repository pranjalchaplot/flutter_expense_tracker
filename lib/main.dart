import 'package:flutter/material.dart';

import '../widgets/user_transaction.dart';
import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Transaction> transactions = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Expense Tracker')),
<<<<<<< HEAD
        body: SingleChildScrollView(
          child: Column(
            children: const [
              Card(
                color: Colors.blue,
                child: SizedBox(
                  width: 100,
                  child: Text('Chart!'),
                ),
              ),
              UserTransaction(),
            ],
          ),
=======
        body: Column(
          children: const [
            Card(
              color: Colors.blue,
              child: SizedBox(
                width: 100,
                child: Text('Chart!'),
              ),
            ),
            UserTransaction(),
          ],
>>>>>>> fb5e971b2d0dad84c2a1ed3d2ed984e2c52a6487
        ),
      ),
    );
  }
}
