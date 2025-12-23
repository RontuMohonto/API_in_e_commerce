import 'package:dada_garments_full_with_api/controller/widgets/text.dart';
import 'package:flutter/material.dart';

class CustomButton_widget extends StatelessWidget {
  const CustomButton_widget({
    super.key, required this.title, required this.onTap,
  });


  final String title;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: Color(0xffFF4748),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: title,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
