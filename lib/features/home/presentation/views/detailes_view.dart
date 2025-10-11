import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';
import 'package:pizza_app/features/home/data/models/pizza_model.dart';
import 'package:pizza_app/features/home/presentation/views/widgets/detailes_view_body.dart';

class DetailesView extends StatelessWidget {
  const DetailesView({super.key, required this.pizzaModel});

  final PizzaModel pizzaModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(backgroundColor: kPrimaryColor),
      body:  DetailesViewBody(pizzaModel: pizzaModel,),
    );
  }
}
