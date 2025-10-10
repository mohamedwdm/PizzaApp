import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pizza_app/constants.dart';
import 'package:pizza_app/features/home/data/repos/pizza_repo_impl.dart';
import 'package:pizza_app/features/home/presentation/manager/pizza_cubit/pizza_cubit.dart';
import 'package:pizza_app/features/home/presentation/views/widgets/home_view_appbar.dart';
import 'package:pizza_app/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PizzaCubit(PizzaRepoImpl())..getAllPizzas(),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: const HomeViewAppBar(),
        body: const HomeViewBody(),
      ),
    );
  }
}
