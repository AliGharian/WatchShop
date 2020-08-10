import 'package:flutter/material.dart';
import 'package:watch_shop/constants.dart';
import 'package:watch_shop/widgets/standard_iconbutton.dart';

class TransparentAppbar extends StatelessWidget {
  final bool state;

  TransparentAppbar({this.state});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0x00FFFFFF),
      elevation: 0.0,
      title: Center(
        child: Icon(
          const IconData(0xe900, fontFamily: 'custom'),
          color: state ? Colors.white : kLightBlack,
          size: 35,
        ),
      ),
      leading: StandardIconButton(
        icon: const IconData(0xe901, fontFamily: 'custom'),
        color: state ? Colors.white : kLightBlack,
        onPressed: () {},
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(4.0),
          child: StandardIconButton(
            icon: const IconData(0xe904, fontFamily: 'custom'),
            color: state ? Colors.white : kLightBlack,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
