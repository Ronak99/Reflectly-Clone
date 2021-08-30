import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reflectly_clone/splash_screens/constants/numerics.dart';

//Ref : https://dartpad.dev/?id=a3c7d5b24443efdf28ecd3ba19222555&null_safety=true
class SplashButtonPopAnimation extends StatefulWidget {
  final Widget child;
  final int delay;
  final int animationDuration;
  final bool includeSlideTransition;

  SplashButtonPopAnimation({
    required this.child,
    required this.animationDuration,
    required this.delay,
    this.includeSlideTransition = true,
  });

  @override
  _SplashButtonPopAnimationState createState() =>
      _SplashButtonPopAnimationState();
}

class _SplashButtonPopAnimationState extends State<SplashButtonPopAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animatable<double> _springCurve;
  late Animation<double> _animOffset;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.animationDuration));

    final linearTween = Tween<double>(begin: 0, end: 1);

    _animOffset = linearTween
        .animate(CurvedAnimation(parent: _controller, curve: SpringCurve()));

    // Curves are nothing but the rate with which the values are lerped from 0 to 1
    // _springCurve = linearTween.chain(CurveTween(curve: const SpringCurve()));

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
    return ScaleTransition(
      scale: _animOffset,
      child: widget.child,
    );
  }
}

/// An example demonstrating how to create your own Curve
/// This example implements a spring curve
class SpringCurve extends Curve {
  const SpringCurve({
    this.amplitude = 0.15,
    this.w = 15,
  });
  final double amplitude;
  final double w;

  @override
  double transformInternal(double t) {
    return -(pow(e, -t / amplitude) * cos(t * w)) + 1;
  }
}
