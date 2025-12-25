import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dada_garments_full_with_api/controller/details_controller/Details_controller_API.dart';
import 'package:dada_garments_full_with_api/controller/widgets/text.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<String> sl = [
    "https://essentialplugin.com/wp-content/uploads/2021/09/5-Best-eCommerce-Product-Sliders-to-make-your-Online-Store-Engaging-1-1-624x312.png",
    "https://i.pinimg.com/736x/b6/89/96/b68996b0aeb13339740f961ada455a77.jpg",
    "https://pixosoft.com/images/sliders/pixosoft-slider-3.jpg",
    "https://i.ytimg.com/vi/XxYqv-_OUzk/maxresdefault.jpg",
    "https://img.freepik.com/free-psd/e-commerce-flat-design-youtube-banner_23-2151267937.jpg?semt=ais_hybrid&w=740&q=80",
  ];
  Map data = {};

  bool isLoading = false;
  List<String> imgList = [];

  fatchData() async {
    isLoading = true;
    setState(() {});
    data = await GetProductDetails().getData();
    if (data.isNotEmpty) {
      for (var i in data['gallery']) {
        imgList.add(i);
      }
    }
    log("=======Data : $data=======");
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    fatchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details of products"), centerTitle: true),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlay: true,
                      aspectRatio: 1,
                    ),
                    items: imgList.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                // image: NetworkImage("${i}"),
                                image: NetworkImage(
                                  "https://b4.coderangon.com/public/storage/products/gallery/xx0m21Vh28OIOxDeviEbW2jef6WCC5pmvOP7WFGN.jpg",
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.green.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Title
                          CustomText(
                            text: "${data['title']}",
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                            maxLines: 2,
                          ),
                          //SKU
                          Row(
                            children: [
                              CustomText(
                                text: "SKU           :",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              CustomText(
                                text: "   ${data['sku']}",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          //brand
                          Row(
                            children: [
                              CustomText(
                                text: "Brand        :",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              CustomText(
                                text: "   ${data['brand']}",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          //Category
                          Row(
                            children: [
                              CustomText(
                                text: "Category  :",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              CustomText(
                                text: "   ${data['category']}",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          //Stock
                          Row(
                            children: [
                              CustomText(
                                text: "stock        :",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              CustomText(
                                text: "   ${data['stock']}",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ],
                          ),

                          //price
                          Row(
                            children: [
                              CustomText(
                                text: "Price        :",
                                color: Colors.black,
                              ),
                              CustomText(
                                text: "    ${data['price']}",
                                color: Colors.black,
                              ),
                              SizedBox(width: 10),
                              CustomText(
                                text: "${data['old_price']}",
                                color: Colors.grey,
                                decorationText: TextDecoration.lineThrough,
                              ),
                            ],
                          ),

                          //Ratings
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                              CustomText(text: "(${data['review_count']})"),
                            ],
                          ),

                          CustomText(
                            text: "Details      :",
                            color: Colors.black,
                          ),
                          CustomText(
                            text: "${data['description']}",
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
