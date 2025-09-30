import 'package:dartz/dartz.dart';
import 'package:pizza_app/core/errors/failure.dart';
import 'package:pizza_app/features/auth/data/models/user_model.dart';

abstract class UserRepo {
  Future<Either<Failure , void>> registerUser({
    required String email,
    required String password,
    required String name,
    required bool hasActiveCart,
  });
  Future<Either<Failure , UserModel>> loginUser({required String email, required String password});
  Future<void> logOut();
}
