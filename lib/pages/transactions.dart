import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/models/transaction.dart';
import 'package:my_app/shared/bottom_navigation_bar.dart';
import 'package:my_app/shared/menu_drawer.dart';
import 'package:my_app/ui/chart.dart';
import 'package:my_app/ui/create-user-form.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  List<Transaction> _transactions = [
    Transaction("patike", 1, 33.33, DateTime.now()),
    Transaction("carape", 1, 3.33, DateTime.now()),
    Transaction("reket", 1, 130.99, DateTime.now()),
    Transaction("laptop", 1, 300.00, DateTime.now()),
  ];
  List<Transaction> get _recentTransactions {
    return _transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  DateTime _dateTime = DateTime.now();
  double get getTotalAmount {
    return _recentTransactions.fold(0.0, (previousValue, element) {
      return previousValue + element.amount;
    });
  }

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      for (var i = 0; i < _recentTransactions.length; i++) {
        if (_recentTransactions[i].date.day == weekDay.day &&
            _recentTransactions[i].date.month == weekDay.month &&
            _recentTransactions[i].date.year == weekDay.year) {
          totalSum += _recentTransactions[i].amount;
        }
      }
      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum
      };
    });
  }

  _addTransaction(Transaction transaction) {
    setState(() {
      _transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2023),
                lastDate: DateTime.now(),
              ).then((value) => {
                    if (value == null)
                      {}
                    else
                      {
                        setState(() {
                          _dateTime = value;
                        })
                      }
                  });
            },
            child: const Icon(Icons.add),
          ),
        ],
        title: const Text("Transactions"),
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const BottomNavBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: (Column(
            children: [
              const Text("transactions"),
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: groupedTransactionValues
                      .map((tx) {
                        // return Text(" ${tx['day']} : ${tx['amount'].toString()}");
                        return Chart(
                            day: tx['day'].toString(),
                            amount: tx['amount'].toString(),
                            amountPercent:
                                (tx['amount'] as double) / getTotalAmount);
                      })
                      .toList()
                      .reversed
                      .toList(),
                ),
              ),
              CreateUserForm(
                dateTime: _dateTime,
                onSubmit: (val) => _addTransaction(val),
              ),
              Text(_dateTime == null
                  ? "Picup a date"
                  : "Date picked : ${DateFormat.yMd().format(_dateTime)}"),
              // Button(
              //   fn: _addTransaction,
              //   color: Theme.of(context).primaryColor,
              //   text: "Add transaction",
              // )
            ],
          )),
        ),
      ),
    );
  }
}
