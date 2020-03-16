import 'dart:async';

import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/material.dart';

import 'main_screens.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  
  final SPLASHSCREEN_DURATION = 3 * 1000;    

  AnimationController controller;

  Animation<double> imageAnimation;
  Animation<Offset> textAnimation;

  @override
  void initState() {
    super.initState();
    runningSplashScreen();
    controllerInitialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void controllerInitialize() {
    controller = AnimationController(
        duration: Duration(milliseconds: SPLASHSCREEN_DURATION), vsync: this);
  }

  void setImageAnimation() {
    imageAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.050,
          0.200,
          curve: Curves.decelerate,
        ),
      ),
    );
  }

  void setTextAnimation() {
    textAnimation =
        Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0)).animate(
            CurvedAnimation(
                parent: controller,
                curve: Interval(0.620, 0.920, curve: Curves.bounceIn)));
  }

  runningSplashScreen() {
    Future.delayed(Duration(seconds: 5), () => onFinish());
  }

  @override
  Widget build(BuildContext context) {
    setImageAnimation();
    setTextAnimation();
    controller.forward();
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext ctx, Widget child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ScaleTransition(
                    scale: imageAnimation,
                    child: Image.asset(
                      'assets/images/logo_cinema.png',
                      fit: BoxFit.fill,
                      height: 60,
                      width: 60,
                      color: AppStyle.getColor(ThemeColor.primary),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SlideTransition(
                    position: textAnimation,
                    child: Text(
                      'Cinema FLT',
                      style: TextStyle(
                          color: AppStyle.getColor(ThemeColor.blackText),
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  onFinish() {
    Navigator.of(context).pushReplacementNamed(MainScreens.routeName);
  }
}
