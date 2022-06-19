import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/login.dart';
import 'package:teslogin/FadeAnimation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenStart();
  }

  splashScreenStart() {
    var waktu = const Duration(seconds: 3);
    return Timer(waktu, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginWidget()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: [],
      body: Stack(children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 108, 169, 223),
                Color.fromARGB(255, 98, 83, 215),
              ],
            ))),
        Center(
          child: FadeAnimation(
            1.6,
            Container(
              child: Image.asset(
                "assets/images/Logo.jpg",
                width: 200,
                height: 200,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
