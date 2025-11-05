import 'package:dartz/dartz.dart';
import 'package:sword_task/domain/entities/register_enitity.dart';
import 'package:sword_task/domain/repositories/register_repository.dart';
import 'package:sword_task/service_failure.dart';

import '../datasources/register_datasource.dart';

class RegisterUserRepoImpl extends RegisterUserRepository {
  final RegisterUserDataSource registerUserDataSource;

  RegisterUserRepoImpl({required this.registerUserDataSource});

  @override
  Future<Either<Failure, RegisterEntity>> registerUser(String email, String password) async {
    try {
      var result = await registerUserDataSource.registerUser(email, password);
      if (result is RegisterEntity) {
        return Right(result);
      } else {
        return Left(Failure(message: result));
      }
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
