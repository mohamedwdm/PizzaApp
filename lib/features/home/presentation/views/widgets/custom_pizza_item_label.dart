import 'package:flutter/material.dart';

class CustomPizzaItemLabel extends StatelessWidget {
  const CustomPizzaItemLabel({
    super.key,
    required this.color,
    required this.text,
    required this.textColor, this.fontWeight,
  });

  final Color color;
  final String text;
  final Color textColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: fontWeight,
            color: textColor,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
