import 'package:flutter/material.dart';
import '../../constants.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  MenuItem({
    this.title,
    this.isSelected,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (isSelected)
          Container(
            height: 3,
            width: 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              color: Colors.white,
            ),
          ),
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: isSelected ? kLightBrown : Colors.white,
              ),
            ),
          ),
        ),
        if (isSelected)
          Container(
            height: 3,
            width: 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              color: Colors.white,
            ),
          ),
      ],
    );
  }
}
