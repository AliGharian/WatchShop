import 'package:flutter/material.dart';
import 'package:watch_shop/constants.dart';

import '../data.dart';

class GridListTile extends StatelessWidget {
  final int index;

  GridListTile({this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 120.0,
              decoration: BoxDecoration(
                color: kLightGrey,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 110.0,
                  child: Image(
                    image: AssetImage(watchImages[index]),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Text(
                  'Rose Gold',
                  style: TextStyle(
                    color: kLightBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  'AMBASSADOR',
                  style: TextStyle(
                    color: kDarkGrey,
                    fontSize: 10.0,
                  ),
                ),
                Text(
                  '\$ 650',
                  style: TextStyle(
                    color: kDarkBrown,
                    fontWeight: FontWeight.w800,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
