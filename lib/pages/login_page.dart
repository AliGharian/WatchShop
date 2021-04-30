import 'package:flutter/material.dart';
import 'package:watch_shop/constants.dart';
import 'package:watch_shop/pages/signup_page.dart';
import 'package:watch_shop/widgets/custom_textfield.dart';
import 'package:watch_shop/widgets/round_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kLightGrey,
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 50.0,
                  color: kLightBlack,
                ),
              ),
              CustomTextField(
                textHint: 'Enter Your UserName...',
                icon: Icons.person,
              ),
              CustomTextField(
                textHint: 'Enter Your Password...',
                icon: Icons.lock,
              ),
              Container(
                padding: EdgeInsets.all(12.0),
                width: size.width * 0.6,
                height: size.height * 0.12,
                child: RoundButton(
                  title: 'Login',
                  color: kLightBrown,
                  onPressed: () {
                    //todo: send a request(get or post) to the api
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account yet?',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: kLightBrown,
                        fontWeight: FontWeight.w800,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
