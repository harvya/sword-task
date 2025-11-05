import 'package:equatable/equatable.dart';
import 'package:sword_task/domain/entities/user_list_entity.dart';

abstract class UserState extends Equatable {
  UserState();

  @override
  List<Object?> get props => [];
}

class UserInitialState extends UserState {}

class GetUserListInitialState extends UserState {
  final bool isPaginating;

  GetUserListInitialState({this.isPaginating = false});

  @override
  List<Object?> get props => [isPaginating];
}

class GetUserListSuccessState extends UserState {
  final List<DatumEntity> accumulatedUsers;

  final int currentPage;
  final int totalPages;

  GetUserListSuccessState({required this.accumulatedUsers, required this.currentPage, required this.totalPages});

  @override
  List<Object?> get props => [accumulatedUsers, currentPage, totalPages];
}

class GetUserListErrorState extends UserState {
  final String message;

  GetUserListErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
