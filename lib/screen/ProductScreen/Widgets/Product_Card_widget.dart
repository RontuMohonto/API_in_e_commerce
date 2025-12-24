import 'package:flutter/material.dart';

import '../../../controller/widgets/text.dart';

class Product_Card_widget extends StatelessWidget {
  const Product_Card_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Colors.green.shade100,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                Container(
                  height: 150,
                  width: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        "https://images.pexels.com/photos/6540996/pexels-photo-6540996.jpeg?cs=srgb&dl=pexels-ox-street-3848035-6540996.jpg&fm=jpg",
                      ),
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                  ),
                ), //image
                CustomText(
                  text: "Party Borkha Abaya Koliza",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 10,
                  children: [
                    CustomText(
                      text: "800",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    CustomText(
                      text: "600",
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
    );
  }
}
