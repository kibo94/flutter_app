import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart(
      {Key? key,
      required this.day,
      required this.amount,
      required this.amountPercent})
      : super(key: key);
  final String day;
  final String amount;
  final double amountPercent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(amount),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                    color: const Color.fromARGB(
                      255,
                      226,
                      222,
                      227,
                    ),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: amountPercent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(day)
      ],
    );
  }
}
