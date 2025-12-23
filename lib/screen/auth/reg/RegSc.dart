import 'dart:developer';

import 'package:flutter/material.dart';

import '../widgets/text.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameC = TextEditingController();
  final TextEditingController numberC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Lets Get Started',
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          CustomText(
            text: 'Create an account',
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 15),
          CustomText(
            text: "Name",
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),

          //name form field
          TextFormField(
            controller: nameC,
            validator: (v) {
              if (v == null || v.isEmpty) {
                return "please enter phone";
              } else {
                return "";
              }
            },
            decoration: InputDecoration(
              hintText: "please enter your phone name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          CustomText(
            text: "Number",
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),

          //number formfield
          TextFormField(
            controller: numberC,
            validator: (v) {
              if (v == null || v.isEmpty) {
                return "please enter phone";
              } else if (!RegExp(r'^(01)[0-9]{9}$').hasMatch((v))) {
                return "please enter a valid number";
              } else {
                return "";
              }
            },
            decoration: InputDecoration(
              hintText: "please enter your password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          //password validator
          CustomText(
            text: "Password",
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          TextFormField(
            controller: passC,
            validator: (v) {
              if (v == null || v.isEmpty) {
                return "please enter password";
              } else if (!RegExp(
                r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%&*]).{8,}$',
              ).hasMatch((v))) {
                return "Password must contain A-Z, a-z, 0-9, special character & minimum 8 characters";
              } else {
                return "";
              }
            },
            decoration: InputDecoration(
              hintText: "please enter your password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 10),

          InkWell(
            onTap: () {
              log("========");
            },
            child: Container(
              height: 60,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Color(0xffF4A758),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Register",
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
