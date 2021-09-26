import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_news/component/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  State createState() => _SplashState();
}

class _SplashState extends State {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child: Image.asset('assets/icon/ic_launcher_adaptive_fore.png'),
        ),
      ),
    );
  }
}
