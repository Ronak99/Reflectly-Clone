import 'package:flutter/material.dart';

class PrimaryHeading extends StatelessWidget {
  final String text;

  const PrimaryHeading({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.w700,
        color: Colors.black.withOpacity(.1),
      ),
      textAlign: TextAlign.center,
    );
  }
}
