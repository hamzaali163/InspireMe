import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inspire_me/routes/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final auth = FirebaseAuth.instance;

  void checkloginstatus() async {
    if (auth.currentUser == null) {
      Timer(Duration(seconds: 3), () {
        Navigator.pushNamed(context, RouteNames.loginscreen);
      });
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.pushNamed(context, RouteNames.bottomnav);
      });
    }
  }

  @override
  void initState() {
    checkloginstatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset('assets/images/logo.png')));
  }
}
