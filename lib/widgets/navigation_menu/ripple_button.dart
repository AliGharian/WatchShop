import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../standard_iconbutton.dart';
import 'animated_icon_button.dart';
import 'navigation_menu_item.dart';

class RippleButton extends StatelessWidget {
  final bool state;
  final Function onPressed;
  final AnimationController animation;
  String _startAnimationName = 'startRotate';
  String _endAnimationName = 'endRotate';
  RippleButton({
    this.state,
    this.onPressed,
    this.animation,
  });
  List<String> menuItems = [
    'Main',
    'The collection',
    'Lookbook',
    'Blog',
    'Support',
    'Contact'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: !state ? onPressed : null,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          print(animation.value);
          return Transform.scale(
            scale: state ? animation.value * 1.0 : animation.value * 1.0 + 0.04,
            origin: Offset(0, 0),
            child: Container(
              height: size.height * 2.0,
              width: size.height * 2.0,
              decoration: BoxDecoration(
                color: kDarkBrown,
                borderRadius: BorderRadius.all(
                  Radius.circular(size.height),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(size.width * 0.08),
                    width: size.height * 0.6,
                    height: size.height * 0.6,
                    child: FlareActor(
                      "assets/flare/watch_cog.flr",
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      color: Colors.white,
                      animation:
                          state ? _startAnimationName : _endAnimationName,
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.32,
                    child: Opacity(
                      opacity: animation.value,
                      child: Container(
                        height: size.height * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                            menuItems.length,
                            (index) {
                              if (index == 0)
                                return MenuItem(
                                  title: menuItems[index],
                                  isSelected: true,
                                );
                              else
                                return MenuItem(
                                  title: menuItems[index],
                                  isSelected: false,
                                );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: size.height * 0.75,
                    child: Opacity(
                      opacity: animation.value,
                      child: StandardIconButton(
                        icon: const IconData(0xe903, fontFamily: 'custom'),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Positioned(
                    left: size.height * 0.75,
                    child: Opacity(
                      opacity: animation.value,
                      child: StandardIconButton(
                        icon: const IconData(0xe902, fontFamily: 'custom'),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  AnimatedIconButton(
                    animation: animation,
                    state: state,
                    onPressed: onPressed,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
