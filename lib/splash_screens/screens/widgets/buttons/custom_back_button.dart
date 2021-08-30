import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 0,
      child: GestureDetector(
        child: RotatedBox(
          quarterTurns: 2,
          child: Icon(
            Icons.arrow_right_alt_sharp,
            color: Colors.white38,
            size: 35,
          ),
        ),
      ),
    );
  }
}
