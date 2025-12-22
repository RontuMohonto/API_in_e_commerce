import 'dart:developer';

import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selected = 1;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  spacing: 10,
                  children: [
                    Text("Sign in"),
                    Container(
                      height: 2,
                      width: MediaQuery.sizeOf(context).width,
                      color: selected == 1
                          ? Colors.orange.shade400
                          : Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selected = 2;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10,
                  children: [
                    Text("Sign in"),
                    Container(
                      height: 2,
                      width: MediaQuery.sizeOf(context).width,
                      color: selected == 2
                          ? Colors.orange.shade400
                          : Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
