import 'package:flutter/material.dart';
import 'package:watch_shop/constants.dart';
import 'package:watch_shop/data.dart';
import 'package:watch_shop/widgets/grid_list_tile.dart';
import 'package:watch_shop/widgets/navigation_menu/ripple_button.dart';
import 'package:watch_shop/widgets/standard_iconbutton.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool _state =
      false; // this state could be enum => state = 0 is button state = 1 is nav menu
  Color appbarColor = kLightBlack;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Color(0x00FFFFFF),
          elevation: 0.0,
          title: Center(
            child: Text(
              'LOGO',
              style: TextStyle(color: _state ? Colors.white : kLightBlack),
            ),
          ),
          leading: StandardIconButton(
            icon: IconData(0xe903, fontFamily: 'custom'),
            color: _state ? Colors.white : kLightBlack,
            onPressed: () {},
          ),
          actions: [
            StandardIconButton(
              icon: IconData(0xe901, fontFamily: 'custom'),
              color: _state ? Colors.white : kLightBlack,
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.0,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              GridView.count(
                crossAxisCount: 2,
                children: List.generate(watchImages.length, (index) {
                  return Container(
                    child: Center(
                      child: GridListTile(index: index),
                    ),
                  );
                }),
              ),
              Positioned(
                bottom: size.height * -0.8,
                child: RippleButton(
                  state: _state,
                  animation: _animationController,
                  onPressed: () {
                    if (_state) {
                      setState(() {
                        _state = !_state;
                      });
                      _animationController.reverse();
                    } else {
                      _animationController.forward();
                      setState(() {
                        _state = !_state;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
