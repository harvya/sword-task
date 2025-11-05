import 'package:dartz/dartz.dart';
import 'package:sword_task/domain/entities/register_enitity.dart';
import 'package:sword_task/service_failure.dart';

abstract class RegisterUserRepository {
  Future<Either<Failure, RegisterEntity>> registerUser(String email, String password);
}
