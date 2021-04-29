import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key key,
    this.title,
    this.onPressed,
    this.color,
  }) : super(key: key);

  final String title;
  final Color color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      textColor: Colors.white,
      onPressed: onPressed,
      shape: StadiumBorder(),
    );
  }
}
