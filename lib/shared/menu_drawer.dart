import 'package:flutter/material.dart';
import 'package:my_app/pages/bmi_page.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/transactions.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      "Home",
      "BMI Calculator",
      "Transactions",
    ];
    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
      child: Text("Globo Fitness"),
      decoration: BoxDecoration(color: Colors.blueGrey),
    ));
    // ignore: avoid_function_literals_in_foreach_calls
    menuTitles.forEach((String element) {
      Widget screen = Container();
      menuItems.add(
        ListTile(
          title: Text(element),
          onTap: () {
            switch (element) {
              case "Home":
                screen = const MyHomePage(
                  title: "Flutter Demo Home Page",
                );
                break;

              case "BMI Calculator":
                screen = const BmiPage();
                break;
              case "Transactions":
                screen = const Transactions();
                break;
              default:
            }
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => screen,
            ));
          },
        ),
      );
    });
    return menuItems;
  }
}
