import 'dart:developer';

import 'package:flutter/material.dart';

import 'Tabbar/tabbar.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: InkWell(
          onTap: () {},
          child: Image(image: AssetImage("assets/images/arrowback.png")),
        ),
        title: Image(image: AssetImage("assets/images/barimage.jpg")),
      ),

      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TabbarWidget(
              onTap: () {
                selected = 1;
                setState(() {});
              },
              selected: selected,
              title: 'Sign in',
            ),
            TabbarWidget(
              onTap: () {
                selected = 2;
                setState(() {});
              },
              selected: selected,
              title: 'Sign up',
            ),
          ],
        ),
      ),
    );
  }
}
