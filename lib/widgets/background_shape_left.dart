import 'package:flutter/material.dart';

class LeftShape extends StatelessWidget {
  final double width;
  const LeftShape({Key? key, this.width=0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(10),
          height: 20,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(2),
                bottomRight: Radius.circular(10),
              ),
              color: Colors.green[500]),
        ),
        SizedBox(width: 10),
        Text('شاخص مثبت', style: TextStyle(color: Color(0xFF4CAF50)),)
      ],
    );
  }
}
