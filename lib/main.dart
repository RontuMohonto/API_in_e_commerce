import 'package:dada_garments_full_with_api/screen/Cart/UI.dart';
import 'package:dada_garments_full_with_api/screen/Details_products/UI.dart';
import 'package:dada_garments_full_with_api/screen/Order/UI.dart';
import 'package:dada_garments_full_with_api/screen/ProductScreen/UI.dart';
import 'package:dada_garments_full_with_api/screen/Shipping_info/UI.dart';
import 'package:dada_garments_full_with_api/screen/auth/UI.dart';
import 'package:dada_garments_full_with_api/screen/auth/reg/RegSc.dart';
import 'package:dada_garments_full_with_api/screen/home/UI.dart';
import 'package:dada_garments_full_with_api/screen/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      home: Cart(),
    );
  }
}
