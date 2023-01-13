import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({super.key});
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
            TextButton(
              onPressed: () {
                // transactions.add(
                //   Transaction(
                //     't3',
                //     titleInput,
                //     amountInput,
                //     DateTime.now(),
                //   ),
                // );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.orange,
              ),
              child: const Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
