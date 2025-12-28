import 'dart:developer';

import 'package:dada_garments_full_with_api/controller/widgets/text.dart';
import 'package:flutter/material.dart';

import '../../controller/products/product_API.dart';
import 'Widgets/Product_Card_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.title});
  final String title;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List ProductLIst = [];
  bool isLoading = true;

  FatchData() async {
    isLoading = true;
    setState(() {});
    ProductLIst = await GetProductController().getProduct(id: widget.title);
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    FatchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFF4F4F),
                Color(0xFFFF9A37)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        title: CustomText(
          text: "Product's",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      body: isLoading == true
          ? Center(child: CircularProgressIndicator(color: Color(0xffFF4444)))
          : GridView.builder(
              itemCount: ProductLIst.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .65,
              ),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Product_Card_widget(AllData: ProductLIst[index]),
              ),
            ),
    );
  }
}
