import 'package:flutter/material.dart';
import 'package:my_app/shared/bottom_navigation_bar.dart';
import 'package:my_app/shared/menu_drawer.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({Key? key}) : super(key: key);

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  final double fontSize = 16;
  late List<bool> isSelected;
  String heightMessage = '';
  String weightMessage = '';
  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        'Please insert your height in ${isMetric ? 'meters' : 'inches'}';
    weightMessage =
        'Please insert your weight in ${isMetric ? 'kilos' : 'pounds'}';
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Calcualtor")),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const BottomNavBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: (Column(
            children: [
              ToggleButtons(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: fontSize),
                    child: Text(
                      "Metric",
                      style: TextStyle(fontSize: fontSize),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: fontSize),
                    child: Text(
                      "Imperial",
                      style: TextStyle(fontSize: fontSize),
                    ),
                  ),
                ],
                isSelected: isSelected,
                onPressed: toggleMesure,
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextField(
                  controller: txtHeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: heightMessage,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextField(
                  controller: txtWeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: weightMessage),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: ElevatedButton(
                        child: const Text('Calculate BMI'),
                        onPressed: (() {
                          findBMI();
                        })),
                  ),
                  ElevatedButton(
                      child: const Text('Reset'),
                      onPressed: (() {
                        setState(() {
                          result = "";
                        });
                      })),
                ],
              ),
              Text(result)
            ],
          )),
        ),
      ),
    );
  }

  void findBMI() {
    double bmi = 0;
    double height = double.tryParse((txtHeight.text)) ?? 0;
    double weight = double.tryParse((txtWeight.text)) ?? 0;
    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }
    setState(() {
      result = 'Your BMI is ${bmi.toStringAsFixed(2)}';
    });
  }

  void toggleMesure(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    if (result.isNotEmpty) {
      findBMI();
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }
}
