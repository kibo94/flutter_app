import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/pages/bmi_page.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/transactions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontFamily: "Roboto",
              fontSize: 23,
            ),
          ),
          primarySwatch: Colors.red,
          platform: TargetPlatform.iOS,
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
            fontFamily: "Roboto",
            fontSize: 20,
          )),
          fontFamily: "Itim"),
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        '/bmi': (context) => const BmiPage(),
        '/transactions': (context) => const Transactions(),
      },
      initialRoute: '/',
    );
  }
}
