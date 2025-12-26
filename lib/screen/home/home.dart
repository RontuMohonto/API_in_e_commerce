import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dada_garments_full_with_api/controller/Homepage_Controller/slider.dart';
import 'package:dada_garments_full_with_api/controller/widgets/text.dart';
import 'package:dada_garments_full_with_api/screen/ProductScreen/Widgets/Product_Card_widget.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<String> imgList = [
    "https://img.freepik.com/free-vector/gradient-shopping-discount-horizontal-sale-banner_23-2150321996.jpg?semt=ais_hybrid&w=740&q=80",
    "https://img.freepik.com/free-psd/horizontal-banner-online-fashion-sale_23-2148585404.jpg?semt=ais_hybrid&w=740&q=80",
    "https://img.freepik.com/free-vector/gradient-shopping-discount-horizontal-sale-banner_23-2150321996.jpg?semt=ais_hybrid&w=740&q=80",
  ];

  List p = [
    {
      "id": 1,
      "title": "Men's Classic Cotton Head Cap",
      "stock": "75",
      "sku": "CAP-COT-BLK",
      "brand": "UrbanStyle",
      "price": "650",
      "old_price": "850",
      "image": "products/PgrKShWTkVMoWefUTr0YxLWiyRRrAXbl3joQrLXe.webp",
      "rating": "4.4",
      "review_count": "89",
      "category": "Head CAP",
    },
  ];

  //empty list to add fetchdata
  List Slider = [];

  fetchData() async {
    Slider = await SliderController().getSliderData();
    log("___________${Slider}");
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF4444),
        centerTitle: true,
        title: CustomText(
          text: "Home",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      backgroundColor: Colors.white,
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: .9,
              height: 150.0,
              autoPlay: true,
              aspectRatio: 1,
            ),
            items: Slider.map((i) {
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
                          "https://eplay.coderangon.com/storage/${i['image']}",
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "Category", color: Colors.black),
                SizedBox(height: 15),
                SizedBox(
                  height: 120,
                  // width: MediaQuery.sizeOf(context).width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, i) => Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 108,
                          width: 95,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              "https://cdn.shortpixel.ai/spio/ret_img,q_orig,to_webp,s_webp/dubaiborka.com.bd/wp-content/uploads/2025/03/5345-3800-1.webp",
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 42,
                          child: Container(
                            height: 18,
                            width: 95,

                            color: Colors.redAccent.shade100,
                            child: Center(child: Text("Women's")),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Hot selling
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Hot selling", color: Colors.black),
                    CustomText(text: "See All", color: Colors.black),
                  ],
                ),
                SizedBox(
                  height: 310,

                  width: MediaQuery.sizeOf(context).width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, i) => SizedBox(
                      width: 200,
                      child: Product_Card_widget(AllData: p[0]),
                    ),
                  ),
                ),
                SizedBox(height: 15),

                //Top selling
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Top selling", color: Colors.black),
                    CustomText(text: "See All", color: Colors.black),
                  ],
                ),
                SizedBox(
                  height: 310,

                  width: MediaQuery.sizeOf(context).width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, i) => SizedBox(
                      width: 200,
                      child: Product_Card_widget(AllData: p[0]),
                    ),
                  ),
                ),
                SizedBox(height: 15),

                //New Product
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    CustomText(text: "New Product", color: Colors.black),
                    CustomText(text: "See All", color: Colors.black),
                  ],
                ),
                SizedBox(
                  height: 310,

                  width: MediaQuery.sizeOf(context).width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, i) => SizedBox(
                      width: 200,
                      child: Product_Card_widget(AllData: p[0]),
                    ),
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
