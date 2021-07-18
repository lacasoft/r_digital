import 'package:flutter/material.dart';

class CustomAppBarTitle extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBarTitle();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Corral Digital',
        style:
            TextStyle(fontWeight: FontWeight.bold, color: Color(0xfff000000)),
      ),
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      centerTitle: true,
      elevation: 0.0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}
