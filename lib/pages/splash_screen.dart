import 'package:flutter/material.dart';
import 'package:watch_shop/pages/login_page.dart';
import 'package:watch_shop/utils/authenticaion.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future<String> userId = getUserId();
    print(userId.toString());
    var d = Duration(seconds: 3);
    Future.delayed(d, () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return userId != null ? HomePage() : LoginPage();
      }), (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.3),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.dstATop),
              image: AssetImage("assets/images/splash_background.jpg"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Icon(
            const IconData(0xe900, fontFamily: 'custom'),
            size: 200,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
