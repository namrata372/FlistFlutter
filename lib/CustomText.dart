import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({this.text = "",this.color = Colors.cyan,});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: color),
        child: Center(child: Text(text),)
      );

  }
}