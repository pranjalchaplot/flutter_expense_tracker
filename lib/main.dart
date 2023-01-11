import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Expense Tracker')),
        body: Column(
          children: const [
            Card(
              child: Text('Char!'),
            ),
            Card(
              child: Text('List of Tx'),
            )
          ],
        ),
      ),
    );
  }
}
