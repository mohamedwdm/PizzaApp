import 'package:dartz/dartz.dart';
import 'package:pizza_app/core/errors/failure.dart';
import 'package:pizza_app/features/home/data/models/pizza_model.dart';

abstract class PizzaRepo {


  Stream<Either<Failure , List<PizzaModel>>> getPizzas();

}