import 'package:flutter/material.dart';
import 'package:my_app/models/cart_item.dart';
import 'package:my_app/models/user_model.dart';
import 'package:my_app/shared/bottom_navigation_bar.dart';
import 'package:my_app/shared/menu_drawer.dart';
import 'package:my_app/ui/container.dart';
import 'package:my_app/ui/item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  var value = false;

  List<ShopItem> items = [
    ShopItem("LAPTOP LENOVO 123", 0, 30000),
    ShopItem("Pegla roventa", 1, 9300),
    ShopItem("SAMSUNG S20 FE", 2, 51000)
  ];
  List<UserModel> newUsers = [
    const UserModel("Bojan", 0, ["html", "css", "js"], false),
  ];

  var detailUsers = [
    {
      "id": 0,
      "name": "Petar",
      "tehs": ["html", "css", "js"],
      "isAdmin": true
    },
    {
      "id": 1,
      "name": "Nina",
      "tehs": ["html", "css", "js", "react"],
      "isAdmin": false
    },
    {
      "id": 2,
      "name": "Darko",
      "tehs": ["html", "css", "c#", "php"],
      "isAdmin": false
    }
  ];
  int level = 3;
  final DateTime date = DateTime.now();
  String get text {
    var resultText = "";
    if (level == 1) resultText = "Low level";
    if (level == 2) resultText = "Medium level";
    if (level == 3) resultText = "High level";
    return resultText;
  }

  Widget build(BuildContext context) {
    _addUser(ShopItem item) {
      setState(() {
        items.add(item);
      });
    }

    return Scaffold(
      drawer: const MenuDrawer(),
      bottomNavigationBar: const BottomNavBar(),
      appBar: AppBar(
        actions: [
          Container(
            alignment: Alignment.center,
            child: const Icon(Icons.shopping_bag),
          )
        ],
        // leading: Icon(Icons.abc),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text(
          "E-commerce Shop",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: AppContainer(
          body: Center(
            child: Column(
              children: [
                // CreateUserForm(
                //   onSubmit: (val) => _addUser(val),
                // ),
                // Text(
                //   DateFormat("yyyy/mm/dd").format(date),
                // ),

                Text(
                  "Products",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                // Container(
                //   color: Colors.white,
                //   height: 300,
                //   child: ListView.builder(
                //     itemBuilder: ((context, index) => Item(item: items[index])),
                //     itemCount: items.length,
                //   ),
                // ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(width: 5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1511556820780-d912e42b4980?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
                    fit: BoxFit.cover,
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                ...items.map((item) => Item(item: item)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
