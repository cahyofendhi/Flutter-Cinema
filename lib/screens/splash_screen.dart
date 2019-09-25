import 'dart:async';

import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/material.dart';

import 'main_screens.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    runningSplashScreen();
  }

  runningSplashScreen() {
    Future.delayed(Duration(seconds: 4), () {
      onFinish();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo_cinema.png',
                fit: BoxFit.fill,
                height: 60,
                width: 60,
                color: AppStyle.getColor(ThemeColor.primary),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Cinema FLT',
                style: TextStyle(
                    color: AppStyle.getColor(ThemeColor.blackText),
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ));
  }

  onFinish() {
    Navigator.of(context).pushReplacementNamed(MainScreens.routeName);
  }
}
