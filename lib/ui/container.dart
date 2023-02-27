import 'package:flutter/cupertino.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({Key? key, required this.body}) : super(key: key);
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: body,
    );
  }
}
