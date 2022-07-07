import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bmi_calc/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 170;
  double weight = 60;
  String resultText = '';
  double weightGood = 100;
  double weightBad = 100;
  Color stateColor = Colors.purple;
  String bg = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg_home.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 405,
                      ),
                      Text(
                        'BMI خودتو',
                        style: TextStyle(fontSize: 25),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        'محاسبه کن',
                        style: TextStyle(fontSize: 33),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (height).toStringAsFixed(0) + ' Cm',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    Text(
                      'قد ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Slider(
                value: height,
                min: 80,
                max: 220,
                onChanged: (value) {
                  setState(() {
                    height = value;
                  });
                },
                activeColor: Color(0xFF00796B).withOpacity(0.8),
                inactiveColor: Colors.black.withOpacity(0.2),
                thumbColor: Color(0xFF00796B),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (weight).toStringAsFixed(0) + ' Kg',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    Text(
                      'وزن  ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Slider(
                value: weight,
                min: 10.0,
                max: 150.0,
                onChanged: (value) {
                  setState(() {
                    weight = value;
                  });
                },
                activeColor: Color(0xFF00796B).withOpacity(0.8),
                inactiveColor: Colors.black.withOpacity(0.2),
                thumbColor: Color(0xFF00796B),
              ),
              SizedBox(
                height: 25,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    primary: Colors.white,
                    minimumSize: Size(347, 47),
                    backgroundColor: Color(0xFF00796B)),
                onPressed: () {
                  double result = weight / pow(height / 100, 2);
                  print(result.round());

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => ResultScreen(
                        result: result,
                        weightBad: weightBad,
                        weightGood: weightGood,
                        resultText: resultText,
                        stateColor: stateColor,
                        bg: bg,
                      ),
                    ),
                  );

                  setState(() {
                    if (result < 18.5) {
                      weightBad = 250;
                      weightGood = 70;
                      resultText = 'کمبود وزن';
                      stateColor = Colors.lightBlue;
                      bg = 'bg1.png';
                    } else if (result >= 18.5 && result <= 24.9) {
                      weightBad = 50;
                      weightGood = 270;
                      resultText = 'نرمال';
                      stateColor = Color(0xFF4CAF50);
                      bg = 'bg2.png';
                    } else if (result >= 25 && result <= 29.9) {
                      weightBad = 220;
                      weightGood = 80;
                      resultText = 'اضافه وزن';
                      stateColor = Colors.amber;
                      bg = 'bg3.png';
                    } else if (result >= 30 && result <= 34.9) {
                      weightBad = 270;
                      weightGood = 65;
                      resultText = 'اضافه وزن زیاد';
                      stateColor = Color(0xFFDA5229);
                      bg = 'bg4.png';
                    } else if (result >= 35) {
                      weightBad = 300;
                      weightGood = 50;
                      resultText = 'چاق مفرط';
                      stateColor = Color(0xFFB91408);
                      bg = 'bg5.png';
                    }
                  });
                },
                child: Text(
                  'محاسبه',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
