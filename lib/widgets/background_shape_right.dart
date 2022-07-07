import 'package:flutter/material.dart';

class RightShape extends StatelessWidget {
  final double width;
  const RightShape({Key? key, this.width = 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'شاخص منفی',
          style: TextStyle(color: Colors.red[500]),
        ),
        SizedBox(width: 10),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(10),
          height: 20,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(2),
              ),
              color: Color(0xFFF44336)),
        ),
      ],
    );
  }
}
