import 'package:flutter/material.dart';

class CheckboxEl extends StatefulWidget {
  const CheckboxEl({Key? key, required this.value, required this.onChange})
      : super(key: key);
  final bool value;
  final Function onChange;

  @override
  State<CheckboxEl> createState() => _CheckboxElState();
}

class _CheckboxElState extends State<CheckboxEl> {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: widget.value,
      onChanged: (val) => {
        widget.onChange(val),
      },
    );
  }
}
