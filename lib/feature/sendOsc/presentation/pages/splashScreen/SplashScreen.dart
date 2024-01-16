import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laser_slides_flutter/colors/Colors.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/pages/home/EditButtonConfig.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/pages/home/Home.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: background,
        child: Center(
          child: Lottie.asset('assets/lottie/sparkle.json'),
        )
      ),
    );
  }
}
