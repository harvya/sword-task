import 'package:dartz/dartz.dart';
import 'package:sword_task/domain/entities/user_list_entity.dart';
import 'package:sword_task/service_failure.dart';

abstract class UserListRepository{
  Future<Either<Failure,UserListEntity>>getUserList(String page);
}