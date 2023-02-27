import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.black,
      child: Column(children: [
        Text(
          "Filters",
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 22),
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              createFilter("Price"),
              createFilter("Type"),
              createFilter("Color"),
              createFilter("Size"),
              createFilter("Price"),
              createFilter("Type"),
              createFilter("Color"),
              createFilter("Size")
            ],
          ),
        )
      ]),
    );
  }

  Widget createFilter(String text) {
    return Container(
      width: 100,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 38, 37, 37),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.all(10),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
