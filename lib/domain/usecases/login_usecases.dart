import 'package:dartz/dartz.dart';
import 'package:sword_task/domain/entities/login_entity.dart';
import 'package:sword_task/domain/repositories/login_repository.dart';
import 'package:sword_task/service_failure.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});

  Future<Either<Failure, LoginEntity>> submit(String email, String password) {
    return loginRepository.submit(email, password);
  }
}
