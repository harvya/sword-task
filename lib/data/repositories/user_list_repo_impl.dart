import 'package:dartz/dartz.dart';
import 'package:sword_task/data/datasources/user_list_datasource.dart';
import 'package:sword_task/domain/entities/user_list_entity.dart';
import 'package:sword_task/domain/repositories/user_list_repository.dart';
import 'package:sword_task/service_failure.dart';

class UserListRepoImpl extends UserListRepository {
  final UserListDataSource userListDataSource;

  UserListRepoImpl({required this.userListDataSource});

  @override
  Future<Either<Failure, UserListEntity>> getUserList(String page) async {
    try {
      var result = await userListDataSource.getUserList(page);
      if (result is UserListEntity) {
        return Right(result);
      } else {
        return Left(Failure(message: result));
      }
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
