import 'package:flutter/material.dart';
import 'package:watch_shop/constants.dart';
import 'package:watch_shop/widgets/custom_textfield.dart';
import 'package:watch_shop/widgets/round_button.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kLightGrey,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 50.0,
                color: kLightBlack,
              ),
            ),
            CustomTextField(
              textHint: 'Enter Your Email...',
              icon: Icons.email,
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
                title: 'Sign Up',
                color: kLightBrown,
                onPressed: () {
                  //todo: send a request(get or post) to the api
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {
                    //todo: should check this field is valid when user pressed the signup button
                  },
                ),
                Text('I agree with terms & conditions'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
