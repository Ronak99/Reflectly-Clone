import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reflectly_clone/splash_screens/screens/widgets/buttons/action_button.dart';
import 'package:reflectly_clone/splash_screens/screens/widgets/buttons/custom_back_button.dart';
import 'package:reflectly_clone/splash_screens/screens/widgets/input/custom_text_field.dart';
import 'package:reflectly_clone/splash_screens/screens/widgets/text/primary_heading.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xff8379c7),
              Color(0xff8b95ea),
            ],
          ),
        ),
        width: double.infinity,
        padding: EdgeInsets.only(left: 20, right: 20, top: 70),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomBackButton(),
            Column(
              children: [
                PrimaryHeading(
                  text: "Account\nLogin",
                ),
                Spacer(),
                CustomTextField(hintText: "Email"),
                CustomTextField(hintText: "Password"),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "FORGOT?",
                    style: TextStyle(
                      color: Colors.white30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Spacer(),
                ActionButton(
                  text: "Sign in",
                  onPressed: () {},
                ),
                SizedBox(height: 25),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "By signing in, you are agreeing to our\n",
                        style: TextStyle(height: 2.2),
                      ),
                      TextSpan(
                        text: "Terms of Service",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(text: " and "),
                      TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          )),
                    ],
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
