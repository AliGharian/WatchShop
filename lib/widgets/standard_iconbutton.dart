import 'package:flutter/material.dart';

class StandardIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final Color color;

  StandardIconButton({this.icon, this.onPressed, this.color});
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: 30,
        ),
      ),
    );
  }
}
