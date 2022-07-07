import 'package:flutter/material.dart';
import 'package:bmi_calc/widgets/background_shape_left.dart';
import 'package:bmi_calc/widgets/background_shape_right.dart';

class ResultScreen extends StatelessWidget {
  final double result;
  final double weightBad;
  final double weightGood;
  final String resultText;
  final Color stateColor;
  final String bg;

  ResultScreen({
    required this.result,
    required this.weightBad,
    required this.weightGood,
    required this.resultText,
    required this.stateColor,
    required this.bg,
  });

  @override
  Widget build(BuildContext context) {
    String resultBMI = result.toStringAsFixed(0);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          // Dynamic background
          image: AssetImage("assets/$bg"), 
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 200),
              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF00796B).withOpacity(0.25),
                        spreadRadius: 10,
                        blurRadius: 35,
                      ),
                    ],
                  ),
                  child: Card(
                    elevation: 0,
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 15),
                        Text(
                          'نتیجه شاخص توده بدنی',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black.withOpacity(0.7),
                          ),
                          textAlign: TextAlign.center,
                        ),

                        Text(resultBMI,
                            style: TextStyle(
                                fontSize: 120, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('$resultText',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: stateColor,
                                ),
                                textAlign: TextAlign.center),
                            Text(' : وضعیت شما',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                                textAlign: TextAlign.center),
                          ],
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  RightShape(width: weightBad),
                  LeftShape(width: weightGood),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: TextButton(
                  style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      primary: Colors.white,
                      minimumSize: Size(347, 47),
                      backgroundColor: Color(0xFF00796B)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'محاسبه مجدد',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
