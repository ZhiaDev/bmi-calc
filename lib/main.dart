import 'package:bmi_calc/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'IRANSans'),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
