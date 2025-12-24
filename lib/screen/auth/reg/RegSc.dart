import 'dart:convert';
import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';


import 'package:dada_garments_full_with_api/controller/auth/regController.dart';
import 'package:flutter/material.dart';

import '../../../controller/widgets/SignUpName_Widget.dart';
import '../../../controller/widgets/SignUpNumber_widget.dart';
import '../../../controller/widgets/SignUpPassword_widget.dart';
import '../../../controller/widgets/custom_button.dart';
import '../../../controller/widgets/text.dart';

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
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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

          //name form field
          CustomText(
            text: "Name",
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          NameFormField(
            nameC: nameC,
            validator: (v) {
              if (v == null || v.isEmpty) {
                return "please enter name";
              } else {
                return null;
              }
            },
            title: 'name',
          ),

          CustomText(
            text: "Number",
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),

          //number formfield
          NumberFormField(
            numberC: numberC,
            validator: (v) {
              if (v == null || v.isEmpty) {
                return "please enter phone";
              } else if (!RegExp(r'^(01)[0-9]{9}$').hasMatch((v))) {
                return "please enter a valid number";
              } else {
                return null;
              }
            },
            title: 'number',
          ),

          //password validator
          CustomText(
            text: "Password",
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          PasswordForm_widget(
            passC: passC,
            validator: (v) {
              if (v == null || v.isEmpty) {
                return "please enter password";
              } else if (!RegExp(
                r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%&*]).{8,}$',
              ).hasMatch((v))) {
                return "Password must contain A-Z, a-z, 0-9, special character & minimum 8 characters";
              } else {
                return null;
              }
            },
            title: 'password',
          ),
          SizedBox(height: 20),

          isLoading == true
              ? Center(
                  child: CircularProgressIndicator(color: Color(0xffFE4546)),
                )
              : CustomButton_widget(
                  title: 'Register',
                  onTap: () async {
                    // if (!_formKey.currentState!.validate()) {
                    //   return;
                    // }
                    var a = {
                      "name": nameC.text,
                      "phone": numberC.text,
                      "password": passC.text,
                    };
                    isLoading = true;
                    setState(() {});
                    bool status = await RegController().CreateAccoutFunction(
                      data: a,
                    );
                    isLoading = false;
                    setState(() {});
                  },
                ),
        ],
      ),
    );
  }
}
