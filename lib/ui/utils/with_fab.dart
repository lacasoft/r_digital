import 'package:corral_digital/ui/widgets/basic_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class WithFabButton extends StatefulWidget {
  const WithFabButton({Key? key}) : super(key: key);

  @override
  _WithFabButtonState createState() => _WithFabButtonState();
}

class _WithFabButtonState extends State<WithFabButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: BasicBottomNavBar(),
    );
  }
}
