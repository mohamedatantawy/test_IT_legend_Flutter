import 'package:flutter/material.dart';

class DiscountText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final Color lineColor;

  const DiscountText({
    super.key,
    required this.text,
    this.fontSize = 12.0,
    this.textColor = Colors.black,
    this.lineColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // The line
        Positioned(
          bottom: 7,
          child: Container(
            height: 1, // Adjust the thickness of the line
            color: lineColor,
            width:
                text.length *
                fontSize *
                0.4, // Adjust width based on text length
          ),
        ),
        // The text
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontWeight: FontWeight.w500, // Medium weight
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
