import 'dart:developer';

import 'package:dada_garments_full_with_api/controller/widgets/text.dart';
import 'package:flutter/material.dart';

import '../../controller/products/product_API.dart';
import 'Widgets/Product_Card_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List ProductLIst = [];
  bool isLoading = true;

  FatchData() async {
    isLoading = true;
    setState(() {});
    ProductLIst = await GetProductController().getProduct();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    FatchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffFF4444),
        title: Text("Product's", style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.white,
      body: isLoading == true
          ? Center(child: CircularProgressIndicator(color: Color(0xffFF4444)))
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .7,
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Product_Card_widget(),
              ),
            ),
    );
  }
}
