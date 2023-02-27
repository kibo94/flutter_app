import 'package:flutter/material.dart';
import 'package:my_app/models/transaction.dart';
import 'package:my_app/ui/button.dart';

class CreateUserForm extends StatefulWidget {
  const CreateUserForm(
      {Key? key, required this.onSubmit, required this.dateTime})
      : super(key: key);
  final Function onSubmit;
  final DateTime dateTime;
  @override
  State<CreateUserForm> createState() => _CreateUserFormState();
}

class _CreateUserFormState extends State<CreateUserForm> {
  final name = TextEditingController();
  final price = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: name,
            decoration: const InputDecoration(labelText: "Name"),
          ),
          TextField(
            controller: price,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Price"),
          ),
          Button(
              color: Colors.green,
              text: "Add product",
              fn: () => {
                    widget.onSubmit(
                      Transaction(
                        name.text,
                        double.parse(price.text),
                        33,
                        widget.dateTime,
                      ),
                    ),
                    _clearForm()
                  })
        ],
      ),
    );
  }

  _clearForm() {
    name.clear();
    price.clear();
  }
}
