import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.color,
    this.decorationText,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final Color? color;
  final  decorationText;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize ?? 22,
        color: color ?? Colors.grey,
        fontWeight: fontWeight ?? FontWeight.w600,
        decoration: decorationText != null
            ? TextDecoration.lineThrough
            : TextDecoration.none,
      ),
    );
  }
}
