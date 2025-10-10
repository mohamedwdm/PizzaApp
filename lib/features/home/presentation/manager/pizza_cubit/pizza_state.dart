part of 'pizza_cubit.dart';

@immutable
sealed class PizzaState {}

final class PizzaInitial extends PizzaState {}

final class PizzaLoading extends PizzaState {}

final class PizzaSuccess extends PizzaState {
  final List<PizzaModel> pizzas;

  PizzaSuccess({required this.pizzas});
}

final class PizzaFailure extends PizzaState {
  final String errorMessage;

  PizzaFailure({required this.errorMessage});
}
