import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final double bottomMargin;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.bottomMargin = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(.1),
      ),
      margin: EdgeInsets.only(bottom: bottomMargin),
      child: TextFormField(
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 22),
        ),
      ),
    );
  }
}
