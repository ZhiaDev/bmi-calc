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
            children: [
              
              /* Result Card Section */
              Expanded(
                flex: 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 230),
                    Container(
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: stateColor.withOpacity(0.2),
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
                                      fontSize: 120,
                                      fontWeight: FontWeight.w700),
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
                  ],
                ),
              ),

              /* Chart Section */
              Expanded(
                flex: 15,
                child: Container(
                  child: Column(
                    children: [
                      RightShape(width: weightBad),
                      LeftShape(width: weightGood),
                    ],
                  ),
                ),
              ),

              /* ReCalculate Button Section */
              Expanded(
                flex: 10,
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              primary: Colors.white,
                              minimumSize: Size(347, 47),
                              maximumSize: Size(347, 47),
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
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
