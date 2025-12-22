import 'package:dada_garments_full_with_api/screen/auth/log/login.dart';
import 'package:flutter/material.dart';

import 'widgets/tabbar.dart';

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
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TabbarWidget(
                  index: 1,
                  selected: selected,
                  title: 'Sign in',
                  onTap: () {
                    setState(() {
                      selected = 1;
                    });
                  },
                ),
                TabbarWidget(
                  index: 2,
                  selected: selected,
                  title: 'Sign up',
                  onTap: () {
                    setState(() {
                      selected = 2;
                    });
                  },
                ),
              ],
            ),
            LoginPage(),
          ],
        ),
      ),
    );
  }
}
