
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pizza_app/features/home/data/models/pizza_model.dart';
import 'package:pizza_app/features/home/data/repos/pizza_repo.dart';

part 'pizza_state.dart';

class PizzaCubit extends Cubit<PizzaState> {
  PizzaCubit(this.pizzaRepo) : super(PizzaInitial());

  final PizzaRepo pizzaRepo;

void getAllPizzas() {
  pizzaRepo.getPizzas().listen((either) {
    either.fold(
      (failure) => emit(PizzaFailure(errorMessage:  failure.errorMessage)),
      (pizzas) => emit(PizzaSuccess(pizzas: pizzas)),
    );
  });
}

}
