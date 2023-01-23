import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactions;

  NewTransaction(this.addTransactions, {super.key}) {
    print('NewTransaction constructor');
  }

  @override
  State<NewTransaction> createState() {
    print('NewTransaction Create State');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  _NewTransactionState() {
    print('NewTransactionState Constructor');
  }

  @override
  void initState() {
    super.initState();
    print('NewTransactionState initState');
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    // oldWidget is given for comparing the (new) widget to oldWidget for convinience.
    super.didUpdateWidget(oldWidget);
    print('NewTransactionState didUpdateWidget');
  }

  @override
  void dispose() {
    print('NewTransactionState dispose');
    super.dispose();
  }

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _pickedDate = DateTime.now();

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    final pickedDate = _pickedDate;

    // print(enteredAmount.toString() + enteredTitle);

    if (enteredTitle.isEmpty || enteredAmount <= 0) return;

    widget.addTransactions(
      enteredTitle,
      enteredAmount,
      pickedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((selectedDate) {
      if (selectedDate == null) return;
      setState(() {
        _pickedDate = selectedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    final double bottomWidth = mediaQuery.viewInsets.bottom;
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: mediaQuery.orientation == Orientation.portrait
                ? bottomWidth + 30
                : bottomWidth + 100,
          ),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(fontFamily: 'OpenSans'),
                ),
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                controller: _amountController,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(fontFamily: 'OpenSans'),
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: _presentDatePicker,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          DateFormat.yMMMd().format(_pickedDate),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _submitData,
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        foregroundColor:
                            Theme.of(context).textTheme.button?.color,
                      ),
                      child: const Text(
                        'Add Transaction',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
