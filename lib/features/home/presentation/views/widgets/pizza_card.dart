import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/features/home/data/models/pizza_model.dart';
import 'package:pizza_app/features/home/presentation/views/detailes_view.dart';
import 'package:pizza_app/features/home/presentation/views/widgets/custom_pizza_item_label.dart';
import 'package:pizza_app/features/home/presentation/views/widgets/home_pizza_price_section.dart';

class PizzaCard extends StatelessWidget {
  const PizzaCard({super.key, required this.pizzaModel});

  final PizzaModel pizzaModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const DetailesView();
              },
            ),
          );
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(pizzaModel.picture),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    CustomPizzaItemLabel(
                      color:
                          pizzaModel.isVeg
                              ? Colors.green.shade500
                              : Colors.red.shade800,
                      text: pizzaModel.isVeg ? 'VEG' : 'NON-VEG',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(width: 8),
                    CustomPizzaItemLabel(
                      color: Colors.green.withValues(alpha: 0.2),
                      text:
                          pizzaModel.spicy == 1
                              ? '🌶 BLAND'
                              : pizzaModel.spicy == 2
                              ? '🌶 BALANCE'
                              : '🌶 SPICEY',
                      textColor:
                          pizzaModel.spicy == 1
                              ? Colors.green
                              : pizzaModel.spicy == 2
                              ? Colors.orange
                              : Colors.redAccent,
                      fontWeight: FontWeight.w800,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  pizzaModel.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  pizzaModel.description,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              HomePizzaPriceSection(pizzaModel: pizzaModel),
            ],
          ),
        ),
      ),
    );
  }
}
