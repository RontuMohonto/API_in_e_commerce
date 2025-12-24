import 'package:carousel_slider/carousel_slider.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details of products"), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                aspectRatio: 1,
              ),
              items: sl.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage("${i}"),
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
              color: Colors.green.shade100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Title
                    CustomText(
                      text: "Men's Sports Mesh Head cap",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
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
                          text: "   AP-3PT-MESH",
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
                          text: "   ActiveGear",
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
                          text: "   Head Cap",
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
                          text: "   500 pcs",
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ],
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
