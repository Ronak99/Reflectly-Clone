import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const ActionButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 180));

    _scaleAnimation = Tween<double>(begin: 1, end: .9).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTapDown: (_) {
          _isPressed = true;
          _animationController.forward();
          setState(() {});
        },
        onTapUp: (_) {
          _isPressed = false;
          _animationController.reverse();
          widget.onPressed();
          setState(() {});
        },
        onTapCancel: () {
          _isPressed = false;
          _animationController.reverse();
          setState(() {});
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 180),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: 50),
          padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                color: _isPressed
                    ? Colors.transparent
                    : Colors.black.withOpacity(.2),
                blurRadius: 15,
                spreadRadius: -2,
              )
            ],
            borderRadius: BorderRadius.circular(50),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.text.toUpperCase(),
            style: TextStyle(
              fontSize: 14,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              color: Color(0xff8b95ea),
            ),
          ),
        ),
      ),
    );
  }
}
