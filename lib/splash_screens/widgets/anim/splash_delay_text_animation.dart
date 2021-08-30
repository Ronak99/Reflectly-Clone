import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reflectly_clone/splash_screens/constants/numerics.dart';

// Code by : https://github.dev/sagarshende23/Reflectly-Flutter-App
// Written by : sagarshende23
class SplashDelayTextAnimation extends StatefulWidget {
  final Widget child;
  final int delay;
  final int animationDuration;
  final bool includeSlideTransition;

  SplashDelayTextAnimation({
    required this.child,
    required this.animationDuration,
    required this.delay,
    this.includeSlideTransition = true,
  });

  @override
  _SplashDelayTextAnimationState createState() =>
      _SplashDelayTextAnimationState();
}

class _SplashDelayTextAnimationState extends State<SplashDelayTextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.animationDuration));
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _controller);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero)
            .animate(curve);

    Timer(Duration(milliseconds: widget.delay), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.includeSlideTransition)
      return FadeTransition(
        child: SlideTransition(
          position: _animOffset,
          child: widget.child,
        ),
        opacity: _controller,
      );

    return FadeTransition(
      opacity: _controller,
      child: widget.child,
    );
  }
}
