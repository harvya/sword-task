import 'package:dartz/dartz.dart';
import 'package:sword_task/domain/entities/register_enitity.dart';
import 'package:sword_task/domain/repositories/register_repository.dart';
import 'package:sword_task/service_failure.dart';

class RegisterUserUseCase {
  final RegisterUserRepository registerUserRepository;

  RegisterUserUseCase({required this.registerUserRepository});

  Future<Either<Failure, RegisterEntity>> registerUser(String email, String password) {
    return registerUserRepository.registerUser(email, password);
  }
}
