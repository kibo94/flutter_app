import 'package:my_app/models/cart_item.dart';
import 'package:my_app/models/user_model.dart';
import 'package:my_app/ui/button.dart';
import 'package:my_app/ui/checkbox.dart';
import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  const Item({Key? key, required this.item}) : super(key: key);
  final ShopItem item;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 31, 32, 32),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Name: ${widget.item.name}",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Price: ${widget.item.price.toString()}",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: (() {
                  print("aded");
                }),
                child: const Text(
                  "Add to cart",
                  style: TextStyle(
                      color: Color.fromARGB(255, 11, 134, 221), fontSize: 17),
                ),
              )
              // Button(
              //   color: Colors.green,
              //   fn: () => {},
              //   text: "Add to cart",
              // )
            ],
          )
        ],
      ),
    );
  }
}
