import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontsize;

  CustomText({
    required this.text,
    required this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      textAlign: TextAlign.center,
      style: new TextStyle(
          //fontFamily: 'Montserrat',
          fontSize: fontsize,
          fontWeight: FontWeight.w300),
    );
  }
}
