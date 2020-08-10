import 'package:flutter/material.dart';
import '../../constants.dart';

class AnimatedIconButton extends StatelessWidget {
  final AnimationController animation;
  final bool state;
  final Function onPressed;

  AnimatedIconButton({this.animation, this.state, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(0.3),
      child: Transform.scale(
        scale: animation.value < 0.01 ? 30 : 1.0,
        child: IconButton(
          onPressed: state ? onPressed : null,
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            color: state ? kDarkBrown : Colors.white,
            progress: animation,
          ),
        ),
      ),
    );
  }
}
