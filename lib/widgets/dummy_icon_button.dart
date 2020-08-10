import 'package:flutter/material.dart';

import '../constants.dart';

class DummyIconButton extends StatelessWidget {
  final String tag;
  final IconData icon;
  DummyIconButton({this.tag, this.icon});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      bottom: size.height * 0.16,
      child: Hero(
        tag: tag,
        child: Container(
          height: size.height * 0.08,
          width: size.height * 0.08,
          decoration: BoxDecoration(
            color: kDarkBrown,
            borderRadius: BorderRadius.all(Radius.circular(size.height * 0.08)),
          ),
          child: Icon(
            icon,
            size: 25,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
