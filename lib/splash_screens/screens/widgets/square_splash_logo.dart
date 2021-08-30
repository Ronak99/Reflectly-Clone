import 'package:flutter/material.dart';
import 'package:reflectly_clone/splash_screens/constants/numerics.dart';


class SquareSplashLogo extends StatefulWidget {
  const SquareSplashLogo({Key? key}) : super(key: key);

  @override
  _SquareSplashLogoState createState() => _SquareSplashLogoState();
}

class _SquareSplashLogoState extends State<SquareSplashLogo> {
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _opacity = 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(milliseconds: splashScreenBgAnimationDuration),
        child: Icon(
          Icons.ac_unit,
          color: Colors.black38,
          size: 100,
        ),
      ),
    );
  }
}
