import 'package:flutter/material.dart';
import 'package:reflectly_clone/splash_screens/constants/numerics.dart';
import 'package:reflectly_clone/splash_screens/widgets/anim/splash_button_pop_animation.dart';
import 'package:reflectly_clone/splash_screens/widgets/anim/splash_delay_text_animation.dart';

import 'widgets/square_splash_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Color _bgGradientInitialAnimColorStart = Color(0xff253a5f);
  Color _bgGradientInitialAnimColorEnd = Color(0xff243b5b);
  Color _bgGradientFinalAnimColorStart = Color(0xff8379c7);
  Color _bgGradientFinalAnimColorEnd = Color(0xff8b95ea);

  late Color _startColor;
  late Color _endColor;

  @override
  void initState() {
    super.initState();

    _initializeBgAnimation();
  }

  _initializeBgAnimation() {
    _startColor = _bgGradientInitialAnimColorStart;
    _endColor = _bgGradientInitialAnimColorEnd;

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _startColor = _bgGradientFinalAnimColorStart;
      _endColor = _bgGradientFinalAnimColorEnd;

      setState(() {});
    });
  }

  _titleText({required String text, required int delay}) =>
      SplashDelayTextAnimation(
        animationDuration: 800,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35.0,
            color: Colors.white,
          ),
        ),
        delay: delay,
      );

  @override
  Widget build(BuildContext context) {
    final _logoEntry = splashScreenBgAnimationDuration - 100;
    final _titleOneEntry = _logoEntry + 100;
    final _titleTwoEntry = _titleOneEntry * 2 - 130;
    final _subtitleEntry = _titleTwoEntry + 900;
    final _actionButtonEntry = _subtitleEntry + 1500;
    final _secondaryActionEntry = _actionButtonEntry + 100;

    Map<String, int> _elementEntryMap = {
      "logo": _logoEntry,
      "title_one": _titleOneEntry,
      "title_two": _titleTwoEntry,
      "subtitle": _subtitleEntry,
      "action_button": _actionButtonEntry,
      "secondary_action": _secondaryActionEntry,
    };

    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: splashScreenBgAnimationDuration),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              _startColor,
              _endColor,
            ],
          ),
        ),
        child: Stack(
          children: [
            SquareSplashLogo(),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _titleText(
                      text: "Hi There,",
                      delay: _elementEntryMap["title_one"]!,
                    ),
                    _titleText(
                      text: "I'm Reflectly",
                      delay: _elementEntryMap["title_two"]!,
                    ),
                    SizedBox(height: 45),
                    SplashDelayTextAnimation(
                      animationDuration: 650,
                      child: Text(
                        "Your new personal\nself-care companion",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white.withOpacity(.4),
                        ),
                      ),
                      includeSlideTransition: false,
                      delay: _elementEntryMap["subtitle"]!,
                    ),
                    Spacer(),
                    SplashButtonPopAnimation(
                      animationDuration: 1000,
                      delay: _elementEntryMap["action_button"]!,
                      child: Container(
                        width: 500,
                        margin: EdgeInsets.symmetric(horizontal: 65),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0,8),
                              color: Colors.black.withOpacity(.2),
                              blurRadius: 10,
                              spreadRadius: -2
                            )
                          ],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "HI, REFLECTLY!",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: _bgGradientFinalAnimColorEnd,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 35),
                    SplashButtonPopAnimation(
                      animationDuration: 1000,
                      delay: _elementEntryMap["secondary_action"]!,
                      child: Text(
                        "I already have an account".toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.white.withOpacity(.4),
                        ),
                      ),
                    ),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
