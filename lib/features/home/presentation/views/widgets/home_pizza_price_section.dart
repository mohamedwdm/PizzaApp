import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';

class HomePizzaPriceSection extends StatelessWidget {
  const HomePizzaPriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                '\$12.00',
                style: TextStyle(
                  fontSize: 16,
                  color: kPriceColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                '\$16.00',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.add_circled_solid),
          ),
        ],
      ),
    );
  }
}
