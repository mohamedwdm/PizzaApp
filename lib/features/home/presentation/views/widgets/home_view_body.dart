import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/core/widgets/custom_error_widget.dart';
import 'package:pizza_app/core/widgets/custom_loading_indecator.dart';
import 'package:pizza_app/features/home/presentation/manager/pizza_cubit/pizza_cubit.dart';
import 'package:pizza_app/features/home/presentation/views/widgets/pizza_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PizzaCubit, PizzaState>(
      builder: (context, state) {
        if (state is PizzaSuccess) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 9 / 16,
              ),
              itemCount: state.pizzas.length,
              itemBuilder: (context, index) {
                return  PizzaCard(pizzaModel: state.pizzas[index]);
              },
            ),
          );
        } else if (state is PizzaFailure) {
          return CustomErrorWidget(errorMessege: state.errorMessage);
        } else {
          return const CustomLoadingIndecator();
        }
      },
    );
  }
}
