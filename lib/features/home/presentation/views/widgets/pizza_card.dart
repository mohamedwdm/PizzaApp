import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/features/home/presentation/views/detailes_view.dart';
import 'package:pizza_app/features/home/presentation/views/widgets/custom_pizza_item_label.dart';
import 'package:pizza_app/features/home/presentation/views/widgets/home_pizza_price_section.dart';

class PizzaCard extends StatelessWidget {
  const PizzaCard({super.key});

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
              Image.asset('assets/images/1.png'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    CustomPizzaItemLabel(
                      color: Colors.red.shade800,
                      text: 'NON-VEG',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(width: 8),
                    CustomPizzaItemLabel(
                      color: Colors.green.withValues(alpha: 0.2),
                      text: '🌶 BALANCE',
                      textColor: Colors.green,
                      fontWeight: FontWeight.w800,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Chessy Marvel',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Crafting joy: your pizza, your rules, best taster',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
             HomePizzaPriceSection(),
            ],
          ),
        ),
      ),
    );
  }
}
