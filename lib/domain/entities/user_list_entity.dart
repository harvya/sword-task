import 'package:equatable/equatable.dart';

class UserListEntity extends Equatable {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<DatumEntity> data;

 const UserListEntity({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  @override
  List<Object?> get props =>[page,perPage,total,totalPages,data];

}

class DatumEntity extends Equatable {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

const DatumEntity({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  @override
  List<Object?> get props => [id,email,firstName,lastName,avatar];

}
