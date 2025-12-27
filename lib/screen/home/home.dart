import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dada_garments_full_with_api/controller/widgets/text.dart';
import 'package:dada_garments_full_with_api/screen/ProductScreen/Widgets/Product_Card_widget.dart';
import 'package:flutter/material.dart';

import '../../controller/Selling_items/selling_items.dart';
import '../../controller/category/categoryController.dart';
import '../../controller/slider/slider.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  // List<String> imgList = [
  //   "https://img.freepik.com/free-vector/gradient-shopping-discount-horizontal-sale-banner_23-2150321996.jpg?semt=ais_hybrid&w=740&q=80",
  //   "https://img.freepik.com/free-psd/horizontal-banner-online-fashion-sale_23-2148585404.jpg?semt=ais_hybrid&w=740&q=80",
  //   "https://img.freepik.com/free-vector/gradient-shopping-discount-horizontal-sale-banner_23-2150321996.jpg?semt=ais_hybrid&w=740&q=80",
  // ];

  bool isLoading = false;

  //empty list to add fetchdata
  List Sliderlist = [];
  List Categorylist = [];
  Map SellingList = {};

  sliderfetchData() async {
    isLoading = true;
    setState(() {});
    Sliderlist = await SliderController().getSliderData();
    isLoading = false;
    setState(() {});
  }

  categoryfetchData() async {
    isLoading = true;
    setState(() {});
    Categorylist = await CategoryController().getCategoryData();
    isLoading = false;
    setState(() {});
  }

  SellingItemsfetchData() async {
    isLoading = true;
    setState(() {});
    SellingList = await SellingItemsController().getSellingsItemsData();
    isLoading = false;
    setState(() {});
    log("${SellingList['hot-selling']}");
  }

  @override
  void initState() {
    sliderfetchData();
    categoryfetchData();
    SellingItemsfetchData();
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
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: .9,
                    height: 150.0,
                    autoPlay: true,
                    aspectRatio: 1,
                  ),
                  items: Sliderlist.map((i) {
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
                //categories
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
                          itemCount: Categorylist.length,
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
                                    "https://eplay.coderangon.com/storage/${Categorylist[i]['image']}",
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 42,
                                child: Container(
                                  height: 18,
                                  width: 95,

                                  color: Colors.redAccent.shade100,
                                  child: Center(
                                    child: Text("${Categorylist[i]['name']}"),
                                  ),
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
                          itemCount: SellingList['hot-selling'].length,
                          itemBuilder: (context, i) => SizedBox(
                            width: 200,
                            child: Product_Card_widget(
                              AllData: SellingList['hot-selling'][i],
                            ),
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
                          itemCount: SellingList['top-selling'].length,
                          itemBuilder: (context, i) => SizedBox(
                            width: 200,
                            child: Product_Card_widget(
                              AllData: SellingList['top-selling'][i],
                            ),
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
                          itemCount: SellingList['new-product'].length,
                          itemBuilder: (context, i) => SizedBox(
                            width: 200,
                            child: Product_Card_widget(
                              AllData: SellingList['new-product'][i],
                            ),
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
