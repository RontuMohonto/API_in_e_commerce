import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dada_garments_full_with_api/controller/details_controller/Details_controller_API.dart';
import 'package:dada_garments_full_with_api/controller/widgets/text.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.Pid});
  final int Pid;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Map data = {};
  bool isLoading = false;
  List<String> imgList = [];

  fatchData() async {
    isLoading = true;
    setState(() {});

    data = await GetProductDetails().getData(id: widget.Pid);

    if (data.isNotEmpty) {
      imgList = List<String>.from(data['gallery']);
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

      // ===== 🌈 GRADIENT APPBAR =====
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFF4F4F),
                Color(0xFFFF9A37),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        title: CustomText(
          text: "Product Details",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      backgroundColor: Color(0xFFFFF3F1),

      body: isLoading
          ? Center(child: CircularProgressIndicator(color: Colors.red))
          : ListView(
        children: [
          //Slider add korsi ekhane
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 250,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: .9,
              ),
              items: imgList.map((i) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.pink.shade50,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  padding: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      "https://b4.coderangon.com/public/storage/$i",
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          //  Product card add korsi ekane
          Padding(
            padding: EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFFE3E0),
                    Color(0xFFFFF1EC),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,

                  children: [
                    // Title
                    CustomText(
                      text: "${data['title']}",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange.shade700,
                    ),

                    Wrap(
                      spacing: 8,
                      children: [
                        badge("Brand", data['brand']),
                        badge("Category", data['category']),
                        badge("SKU", data['sku']),
                        badge("Stock", data['stock'].toString()),
                      ],
                    ),

                    // Price Box
                    Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.orange.shade200),
                      ),
                      child: Row(
                        children: [
                          CustomText(
                            text: "৳${data['price']}",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                          SizedBox(width: 8),
                          CustomText(
                            text: "৳${data['old_price']}",
                            color: Colors.grey,
                            decorationText: TextDecoration.lineThrough,
                          ),
                        ],
                      ),
                    ),

                    // Ratings
                    Row(
                      children: [
                        ...List.generate(
                          5,
                              (i) => Icon(Icons.star,
                              color: Colors.amber, size: 22),
                        ),
                        SizedBox(width: 6),
                        CustomText(
                            text: "(${data['review_count']})",
                            color: Colors.black54),
                      ],
                    ),

                    Divider(),

                    // Description
                    CustomText(
                      text: "Description:",
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.red.shade700,
                    ),

                    CustomText(
                      text: "${data['description']}",
                      color: Colors.black87,
                      fontSize: 14,
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

  // ===== BADGE DESIGN =====
  Widget badge(String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.pink.withOpacity(.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.pink.shade300),
      ),
      child: Text(
        "$title: $value",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: Colors.red.shade700,
        ),
      ),
    );
  }
}
