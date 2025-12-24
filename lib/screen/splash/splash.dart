import 'dart:developer';

import 'package:dada_garments_full_with_api/screen/auth/UI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  TimerFunction() async {
    late FlutterSecureStorage _storage = FlutterSecureStorage();
    var t = await _storage.read(key: "token");

    log("==========TT : $t======");
    if (t == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AuthScreen()),
      );
    }
  }

  @override
  void initState() {
    TimerFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image(image: AssetImage("assets/images/splash.png"))),
    );
  }
}
