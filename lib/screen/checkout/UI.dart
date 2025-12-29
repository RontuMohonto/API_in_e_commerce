import 'dart:convert';
import 'dart:developer';
import 'package:dada_garments_full_with_api/controller/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../controller/Checkout/CheckOut_Controller.dart';
import '../../controller/widgets/text.dart';
import '../Shipping_info/UI.dart';
import '../home/UI.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.productData});
  final Map productData;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  Map userData = {};
  Map product = {};

  getUserData() async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    var d = await storage.read(key: "shipping");
    if (d != null) {
      userData = jsonDecode(d);
    }
    setState(() {});
  }

  getProductData() async {
    product = widget.productData;
    setState(() {});
  }

  @override
  void initState() {
    getUserData();
    getProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

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
          text: "Checkout",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // informations
            CustomText(
              text: "Shipping Information",
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade900,
            ),
            const SizedBox(height: 10),

            userData.isEmpty
                ? InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ShippingScreen()),
                      ).then((_) => getUserData());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Center(
                        child: Column(
                          spacing: 8,
                          children: [
                            Icon(Icons.add_circle_outline, size: 35),
                            CustomText(
                              text: "Add Shipping Information",
                              fontSize: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Row(
                              children: [
                                CustomText(text: "Name    : "),
                                Expanded(
                                  child: CustomText(
                                    text: "${userData['name']}",
                                    color: Colors.green.shade900,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CustomText(text: "Phone   : "),
                                Expanded(
                                  child: CustomText(
                                    text: "${userData['phone']}",
                                    color: Colors.green.shade900,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: "Address: "),
                                Expanded(
                                  child: CustomText(
                                    text:
                                        "${userData['street']}, ${userData['upazila']}, ${userData['district']}",
                                    color: Colors.green.shade900,
                                    maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        top: 10,
                        right: 10,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ShippingScreen(),
                              ),
                            ).then((_) => getUserData());
                          },
                          child: Icon(Icons.edit, color: Colors.blueAccent),
                        ),
                      ),
                    ],
                  ),

            const SizedBox(height: 20),

            //product card
            CustomText(
              text: "Product",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                spacing: 16,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://eplay.coderangon.com/storage/${product['image']}",
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 6,
                      children: [
                        CustomText(
                          text: "${product['title']}",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomText(text: "Brand: ${product['brand']}"),
                        Row(
                          spacing: 10,
                          children: [
                            CustomText(
                              text: "BDT ${product['price']}",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            CustomText(
                              text: "${product['old_price']}",
                              decorationText: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            //button disi ekhane
            CustomButton_widget(
              title: "Confirm Checkout",
              onTap: () async {
                var checkout = {
                  "customer_name": userData['name'],
                  "customer_phone": userData['phone'],
                  "payment_method": "cod",
                  "items": [
                    {
                      "product_id": product['id'],
                      "product_name": product['title'],
                      "price": product['price'],
                      "quantity": 1,
                    },
                  ],
                  "address": {
                    "street": userData['street'],
                    "upazila": userData['upazila'],
                    "district": userData['district'],
                  },
                };

                log("Checkout: ${jsonEncode(checkout)}");

                bool status = await CheckOutService().sentData(data: checkout);

                if (status == true) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => home()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
