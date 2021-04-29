import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final textHint;
  final icon;
  CustomTextField({this.textHint, this.icon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: textHint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
