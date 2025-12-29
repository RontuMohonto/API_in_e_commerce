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
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController nameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController streetC = TextEditingController();
  TextEditingController upazillaC = TextEditingController();
  TextEditingController districtC = TextEditingController();
  bool isLoading = false;
  Map userData = {};

  getUserData() async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    var d = await storage.read(key: "shipping");
    log("===D : $d===========");
    if (d != null) {
      userData = jsonDecode(d);
      log("===userData : ${userData['name']}======");
      nameC.text = userData['name'];
      phoneC.text = userData['phone'];
      streetC.text = userData['street'];
      upazillaC.text = userData['upazilla'];
      districtC.text = userData['district'];
    }
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
          text: "Shipping",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Let's Start",
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 5),
                //Name
                NameFormField(
                  nameC: nameC,
                  validator: (v) {
                    if (v == null || v == "") {
                      return "Please enter Name";
                    }
                    return null;
                  },
                  title: "name",
                ),
                //Phone
                NameFormField(
                  nameC: phoneC,
                  validator: (v) {
                    if (v == null || v == "") {
                      return "Please enter Phone";
                    }
                    return null;
                  },
                  title: "Phone",
                ),
                //Street
                NameFormField(
                  nameC: streetC,
                  validator: (v) {
                    if (v == null || v == "") {
                      return "Please enter Phone";
                    }
                    return null;
                  },
                  title: "Street",
                ),
                //"Upazila
                NameFormField(
                  nameC: upazillaC,
                  validator: (v) {
                    if (v == null || v == "") {
                      return "Please enter Phone";
                    }
                    return null;
                  },
                  title: "Upazilla",
                ),
                //District
                NameFormField(
                  nameC: districtC,
                  validator: (v) {
                    if (v == null || v == "") {
                      return "Please enter District";
                    }
                    return null;
                  },
                  title: "District",
                ),
                CustomButton_widget(
                  title: "Next",
                  onTap: () async {
                    if (!_formkey.currentState!.validate()) {
                      return;
                    }
                    var CKdata = {
                      "name": nameC.text,
                      "phone": phoneC.text,
                      "street": streetC.text,
                      "upazilla": upazillaC.text,
                      "district": districtC.text,
                    };
                    log("====${CKdata}====");
                    FlutterSecureStorage storage = FlutterSecureStorage();
                    await storage.write(
                      key: "shipping",
                      value: jsonEncode(CKdata),
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
