import 'package:dartz/dartz.dart';
import 'package:sword_task/domain/entities/user_list_entity.dart';
import 'package:sword_task/domain/repositories/user_list_repository.dart';
import 'package:sword_task/service_failure.dart';

class UserListUseCases {
  final UserListRepository userListRepository;

  UserListUseCases({required this.userListRepository});

  Future<Either<Failure, UserListEntity>> getUserList(String page) {
    return userListRepository.getUserList(page);
  }
}
