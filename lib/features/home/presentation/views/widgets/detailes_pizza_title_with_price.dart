import 'package:flutter/material.dart';
import 'package:pizza_app/features/home/presentation/views/widgets/detailes_price_section.dart';

class DetailesPizzaTitleWithPrice extends StatelessWidget {
  final String title;
  final String currentPrice;
  final String oldPrice;

  const DetailesPizzaTitleWithPrice({
    super.key,
    required this.title,
    required this.currentPrice,
    required this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerRight,
            child: DetailesPriceSection(
              currentPrice: currentPrice,
              oldPrice: oldPrice,
            ),
          ),
        ),
      ],
    );
  }
}
