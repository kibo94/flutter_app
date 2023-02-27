import 'package:flutter/material.dart';

class RoundedBox extends StatelessWidget {
  const RoundedBox({
    Key? key,
    required this.component,
  }) : super(key: key);
  final Widget component;

  @override
  Widget build(BuildContext context) {
    var x = 20.0;
    return Container(
      padding: const EdgeInsets.all(20),
      child: component,
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
