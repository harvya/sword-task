import 'package:dartz/dartz.dart';
import 'package:sword_task/data/datasources/login_datasource.dart';
import 'package:sword_task/domain/entities/login_entity.dart';
import 'package:sword_task/domain/repositories/login_repository.dart';
import 'package:sword_task/service_failure.dart';

class LoginRepoImpl extends LoginRepository{
  final LoginDataSource loginDataSource;
  LoginRepoImpl({required this.loginDataSource});

  @override
  Future<Either<Failure, LoginEntity>> submit(String email, String password) async{
    try {
      var result = await loginDataSource.submit(email, password);
      if (result is LoginEntity) {
        return Right(result);
      } else {
        return Left(Failure(message: result));
      }
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

}