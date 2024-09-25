import 'package:flutter/material.dart';
import 'dart:async';
import 'getStarted.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rodha.lk',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 500), () {
      Navigator.of(context).push(_createRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF6A00),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
          ],
        ),
      ),
    );
  }
}


Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Getstarted(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const beginScale = 0.8;
      const endScale = 1.0;
      const beginOpacity = 0.0;
      const endOpacity = 1.0;
      var tweenScale = Tween(begin: beginScale, end: endScale);
      var tweenOpacity = Tween(begin: beginOpacity, end: endOpacity);

      var scaleAnimation = animation.drive(tweenScale);
      var fadeAnimation = animation.drive(tweenOpacity);

      return FadeTransition(
        opacity: fadeAnimation,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: child,
        ),
      );
    },
  );
}