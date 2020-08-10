import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watch_shop/constants.dart';
import 'package:watch_shop/data.dart';
import 'package:watch_shop/pages/detail_page.dart';
import 'package:watch_shop/widgets/app_bar.dart';
import 'package:watch_shop/widgets/grid_list_tile.dart';
import 'package:watch_shop/widgets/navigation_menu/ripple_button.dart';

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
    SystemChrome.setEnabledSystemUIOverlays([]);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child: Hero(
            tag: 'appbar_tag',
            child: TransparentAppbar(
              state: _state,
            ),
          ),
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
                      child: GridListTile(
                          index: index,
                          onTap: () {
                            // setState(() {
                            //   detailPageVisibility = true;
                            // });
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, animation2) =>
                                    DetailPage(
                                  index: index,
                                ),
                                transitionsBuilder:
                                    (context, animation, animation2, child) =>
                                        FadeTransition(
                                            opacity: animation, child: child),
                                transitionDuration: Duration(milliseconds: 500),
                              ),
                            );
                          }),
                    ),
                  );
                }),
              ),
              DummyIconButton(
                tag: 'FAB3_tag',
                icon: Icons.bookmark_border,
              ),
              DummyIconButton(
                tag: 'FAB_tag',
                icon: null,
              ),
              DummyIconButton(
                tag: 'FAB2_tag',
                icon: Icons.arrow_back,
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
