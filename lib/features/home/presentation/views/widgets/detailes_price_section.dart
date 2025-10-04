import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';

class DetailesPriceSection extends StatelessWidget {
  final String currentPrice;
  final String oldPrice;

  const DetailesPriceSection({
    super.key,
    required this.currentPrice,
    required this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          currentPrice,
          style: const TextStyle(
            fontSize: 20,
            color: kPriceColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          oldPrice,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ],
    );
  }
}
