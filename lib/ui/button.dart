import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({Key? key, required this.fn, required this.text, this.color})
      : super(key: key);
  final Function fn;
  final String text;
  final color;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.fn(),
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(12.0),
        child: Text(
          widget.text,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: widget.color ?? Colors.red,
        ),
      ),
    );
  }
}
