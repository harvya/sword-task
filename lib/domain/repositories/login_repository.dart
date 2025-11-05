import 'package:dartz/dartz.dart';
import 'package:sword_task/domain/entities/login_entity.dart';
import 'package:sword_task/service_failure.dart';

abstract class LoginRepository{
  Future<Either<Failure,LoginEntity>>submit(String email, String password);
}