import 'package:flutter/material.dart';

class CustomAppBg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Image.asset(
            "assets/CowBackground.svg",
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomLeft,
          ),
        ),
        Center(
          child: Text("App content would be here"),
        )
      ],
    );
  }
}
