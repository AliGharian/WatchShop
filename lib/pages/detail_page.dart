import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watch_shop/constants.dart';
import 'package:watch_shop/data.dart';
import 'package:watch_shop/widgets/app_bar.dart';

class DetailPage extends StatefulWidget {
  final int index;
  DetailPage({this.index});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  double FABsPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.reverse();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    int index = widget.index;
    Size size = MediaQuery.of(context).size;
    setState(() {
      FABsPosition = size.width * 0.05;
    });
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: Hero(
            tag: 'appbar_tag',
            child: TransparentAppbar(
              state: false,
            )),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Hero(
            tag: 'background_tag$index',
            child: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                color: kLightGrey,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.25,
            right: size.width * 0.15,
            child: Container(
              height: size.width * 0.55,
              width: size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(size.width * 0.5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    offset: Offset(1.0, 0.0),
                    blurRadius: 40.0,
                    spreadRadius: 0.0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.12,
            child: Container(
              height: size.height * 0.4,
              child: Hero(
                tag: 'image_tag$index',
                child: Image(
                  image: AssetImage(watchImages[index]),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.25,
            child: Container(
              height: size.height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Heritage 1995',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '\$ 650',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: kDarkBrown,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'MOVEMENT:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' Japanese Quartz Movemet',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'CASE:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' 40mm polished stainless steel',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            bottom: size.height * 0.16,
            // right: (1 - _animationController.value) + size.width * 0.1,
            right: FABsPosition,
            child: Hero(
              tag: 'FAB3_tag',
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: kDarkBrown,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.bookmark_border,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            bottom: size.height * 0.16,
            // right: (1 - _animationController.value) + size.width * 0.1,
            right: FABsPosition + 60,
            left: FABsPosition + 60,
            child: Hero(
              tag: 'FAB_tag',
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: kDarkBrown,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'ADD TO CART',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            bottom: size.height * 0.16,
            // left: (1 - _animationController.value) + size.width * 0.1,
            left: FABsPosition,
            child: Hero(
              tag: 'FAB2_tag',
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: kDarkBrown,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: AnimatedIcon(
                      progress: _animationController,
                      icon: AnimatedIcons.menu_arrow,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.04,
            child: Column(
              children: [
                Text('ABOUT'),
                SizedBox(
                  height: 10.0,
                ),
                Icon(Icons.more_vert),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
