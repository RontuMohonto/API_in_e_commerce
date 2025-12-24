import 'dart:developer';

import 'package:dada_garments_full_with_api/controller/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../controller/auth/loginController.dart';
import '../../../controller/login_Phone_widgets/password_field.dart';
import '../../../controller/login_Phone_widgets/phonefield.dart';
import '../../../controller/widgets/text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();

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

          // login page phone number input
          Login_phone_field(phoneNumberController: phoneNumberController),

          CustomText(text: "password", color: Colors.black),
          login_password_form(
            PasswordController: PasswordController,
            validator: (value) {},
            title: 'pleasse enter yourt password',
          ),
          SizedBox(height: 10),
          CustomButton_widget(
            title: "Login",
            onTap: () {
              log("=====${PasswordController.text}====");
              LoginController().login(phone: phoneNumberController.text, password: PasswordController.text);
            },
          ),
        ],
      ),
    );
  }
}
