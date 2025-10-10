import 'package:dartz/dartz.dart';
import 'package:pizza_app/core/errors/failure.dart';
import 'package:pizza_app/features/home/data/models/pizza_model.dart';
import 'package:pizza_app/features/home/data/repos/pizza_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PizzaRepoImpl implements PizzaRepo {
  Stream<Either<Failure, List<PizzaModel>>> getPizzas() {
    try {
      final stream = Supabase.instance.client
          .from('pizzas') 
          .stream(primaryKey: ['id'])
          .order('created_at', ascending: false)
          .map((rows) {
        final pizzas = rows.map((json) => PizzaModel.fromJson(json)).toList();
        return right<Failure, List<PizzaModel>>(pizzas);
      });
      return stream;
    } catch (e) {
      return Stream.value(left(Failure(errorMessage: e.toString())));
    }
  }
}
