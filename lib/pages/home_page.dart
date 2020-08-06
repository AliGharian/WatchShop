import 'package:flutter/material.dart';
import 'package:watch_shop/data.dart';
import 'package:watch_shop/widgets/appbar.dart';
import 'package:watch_shop/widgets/grid_list_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Stack(
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
                top: 0,
                left: 0,
                right: 0,
                child: TransparentAppBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
