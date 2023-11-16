import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessLottie extends StatefulWidget {
  @override
  _SuccessLottieState createState() => _SuccessLottieState();
}

class _SuccessLottieState extends State<SuccessLottie> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 1890), () {
      Navigator.of(context).pop();
    });
  }

  @override
  void dispose() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.transparent,
        width: 180,
        child: Lottie.asset(
          'assets/animations/lottie/Success.json',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
