import 'package:my_app/models/user_model.dart';
import 'package:my_app/ui/checkbox.dart';
import 'package:flutter/material.dart';

class User extends StatefulWidget {
  const User({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${widget.user.name} is admin",
            style: const TextStyle(color: Colors.white, fontSize: 33),
          ),
          CheckboxEl(
              onChange: (val) => {
                    // detailUsers[detailUser['id'] as int]["isAdmin"] = val,
                    // setState(() {
                    //   detailUsers = detailUsers;
                    // }),
                  },
              value: widget.user.isAdmin!),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Tehnlogies ",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              ...widget.user.tehs.map((teh) {
                return Text(
                  teh + " ",
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                );
              }).toList()
            ],
          )
        ],
      ),
    );
  }
}
