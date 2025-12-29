import 'dart:convert';
import 'dart:developer';

import 'package:dada_garments_full_with_api/controller/widgets/SignUpName_Widget.dart';
import 'package:dada_garments_full_with_api/controller/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../controller/widgets/text.dart';

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({super.key});

  @override
  State<ShippingScreen> createState() => _LoginState();
}

class _LoginState extends State<ShippingScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameC = TextEditingController();
  final TextEditingController phoneC = TextEditingController();
  final TextEditingController streetC = TextEditingController();
  final TextEditingController upazilaC = TextEditingController();
  final TextEditingController districtC = TextEditingController();
  bool isLoading = false;

  Map userData = {};

  getUserData() async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    var d = await storage.read(key: "shipping");
    log("======D : $d");
    if (d != null) {
      userData = jsonDecode(d);
      log("======userData : ${userData['name']}");
      nameC.text = userData['name'];
      phoneC.text = userData['phone'];
      streetC.text = userData['street'];
      upazilaC.text = userData['upazila'];
      districtC.text = userData['district'];
    }
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF4F4F), Color(0xFFFF9A37)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        title: CustomText(
          text: "Shipping Information",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Let's Start",
                  fontSize: 22,
                  color: Colors.black,
                ),
                SizedBox(height: 5),
                NameFormField(
                  nameC: nameC,
                  validator: (v) {
                    if (v == null || v == "") {
                      return "Please enter Name";
                    }
                    return null;
                  },
                  title: 'Name',
                ),

                NameFormField(
                  nameC: phoneC,
                  validator: (v) {
                    if (v == null || v == "") {
                      return "Please enter Phone";
                    }
                    return null;
                  },
                  title: 'Phone',
                ),
                NameFormField(
                  nameC: streetC,
                  validator: (v) {
                    if (v == null || v == "") {
                      return "Please enter Street";
                    }
                    return null;
                  },
                  title: 'Street',
                ),
                NameFormField(
                  nameC: upazilaC,
                  validator: (v) {
                    if (v == null || v == "") {
                      return "Please enter Upazela";
                    }
                    return null;
                  },
                  title: 'Upazela',
                ),
                NameFormField(
                  nameC: districtC,
                  validator: (v) {
                    if (v == null || v == "") {
                      return "Please enter District";
                    }
                    return null;
                  },
                  title: 'District',
                ),

                isLoading == true
                    ? Center(child: CircularProgressIndicator())
                    : CustomButton_widget(
                        title: 'Next',
                        onTap: () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          var data = {
                            "name": nameC.text,
                            "phone": phoneC.text,
                            "street": streetC.text,
                            "upazila": upazilaC.text,
                            "district": districtC.text,
                          };
                          log("===========${data}==");
                          FlutterSecureStorage storage = FlutterSecureStorage();
                          await storage.write(
                            key: "shipping",
                            value: jsonEncode(data),
                          );
                          Navigator.pop(context);
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
