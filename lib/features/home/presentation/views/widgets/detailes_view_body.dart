import 'package:flutter/material.dart';
import 'package:pizza_app/core/widgets/custom_button.dart';
import 'package:pizza_app/features/home/presentation/views/widgets/detailes_pizza_image_card.dart';
import 'package:pizza_app/features/home/presentation/views/widgets/detailes_pizza_macro_row.dart';
import 'package:pizza_app/features/home/presentation/views/widgets/detailes_pizza_title_with_price.dart';

class DetailesViewBody extends StatelessWidget {
  const DetailesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const DetailesPizzaImageCard(),
          const SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(3, 3),
                  color: Colors.grey.shade300,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const DetailesPizzaTitleWithPrice(
                    title: "Truffle Temptation Extravaganza",
                    currentPrice: "\$12.00",
                    oldPrice: "\$16.00",
                  ),
                  const SizedBox(height: 8),
                  const DetailesPizzaMacroRow(),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: CustomButton(
                      fontsize: 18,
                      backgroundcolor: Colors.black,
                      textcolor: Colors.white,
                      text: 'Buy Now',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
