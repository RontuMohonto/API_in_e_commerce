import 'dart:developer';

import 'package:dada_garments_full_with_api/controller/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../controller/widgets/text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Welcome Back',
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          CustomText(
            text: 'Please enter your details to login.',
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 15),
          CustomText(
            text: "Phone Number",
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          TextFormField(
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
              hintText: "please enter your phone number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          CustomText(text: "password",color: Colors.black,),
          TextFormField(
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
              hintText: "please enter your phone password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 10),
          CustomButton_widget(
            title: "Login",
            onTap: () {
              log("=========");
            },
          ),
        ],
      ),
    );
  }
}
