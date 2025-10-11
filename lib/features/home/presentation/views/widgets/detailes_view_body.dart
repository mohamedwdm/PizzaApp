import 'package:flutter/material.dart';
import 'package:pizza_app/core/widgets/custom_button.dart';
import 'package:pizza_app/features/home/data/models/pizza_model.dart';
import 'package:pizza_app/features/home/presentation/views/widgets/detailes_pizza_image_card.dart';
import 'package:pizza_app/features/home/presentation/views/widgets/detailes_pizza_macro_row.dart';
import 'package:pizza_app/features/home/presentation/views/widgets/detailes_pizza_title_with_price.dart';

class DetailesViewBody extends StatelessWidget {
  const DetailesViewBody({super.key, required this.pizzaModel});

  final PizzaModel pizzaModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          DetailesPizzaImageCard(imageLink: pizzaModel.picture),
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
                  DetailesPizzaTitleWithPrice(
                    title: pizzaModel.name,
                    currentPrice: '\$${(pizzaModel.price - (pizzaModel.price *pizzaModel.discount / 100)).toStringAsFixed(2)}',
                    oldPrice: '\$${pizzaModel.price.toStringAsFixed(2)}',
                  ),
                  const SizedBox(height: 8),
                   DetailesPizzaMacroRow(macros: pizzaModel.macros,),
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
