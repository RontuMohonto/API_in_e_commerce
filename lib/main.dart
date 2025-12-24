import 'package:dada_garments_full_with_api/screen/auth/UI.dart';
import 'package:dada_garments_full_with_api/screen/auth/reg/RegSc.dart';
import 'package:dada_garments_full_with_api/screen/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),

      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
