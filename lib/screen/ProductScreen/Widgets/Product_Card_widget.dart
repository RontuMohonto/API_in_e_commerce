import 'dart:developer';

import 'package:dada_garments_full_with_api/controller/products/product_API.dart';
import 'package:dada_garments_full_with_api/screen/Details_products/UI.dart';
import 'package:flutter/material.dart';

import '../../../controller/widgets/text.dart';

class Product_Card_widget extends StatefulWidget {
  const Product_Card_widget({super.key, this.AllData});

  final dynamic AllData;

  @override
  State<Product_Card_widget> createState() => _Product_Card_widgetState();
}

class _Product_Card_widgetState extends State<Product_Card_widget> {
  @override
  Widget build(BuildContext context) {
    log(">>> ${widget.AllData['title']}");

    return InkWell(
      onTap: (){
        log("======Clicked  : ${widget.AllData['id']}=========");
        Navigator.push(context, MaterialPageRoute(builder: (c) => Details(Pid: widget.AllData['id'],)));
      },
      child: Stack(
        children: [
          Card(
            color: Colors.green.shade100,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
                children: [
                  Container(
                    height: 150,
                    width: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage("https://eplay.coderangon.com/public/storage/${widget.AllData['image']}"),
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                    ),
                  ), //image
                  CustomText(
                    text: widget.AllData['title'],
                    maxLines: 2,

                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 10,
                    children: [
                      CustomText(
                        text: widget.AllData['price'],
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      CustomText(
                        text: widget.AllData['old_price'],
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        decorationText: TextDecoration.lineThrough,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //add to cart button
                      Container(
                        height: 40,
                        width: 95,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 2,
                            ),
                            child: CustomText(
                              text: "Add to cart",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 4,
            left: 12,
            child: Image.asset("assets/images/offer.png", height: 40),
          ),
        ],
      ),
    );
  }
}
