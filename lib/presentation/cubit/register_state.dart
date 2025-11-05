import 'package:equatable/equatable.dart';
import 'package:sword_task/domain/entities/register_enitity.dart';

abstract class RegisterUserState extends Equatable {
  const RegisterUserState();

  @override
  List<Object?> get props => [];
}

class RegisterUserInitialState extends RegisterUserState {}

class CreateUserInitialState extends RegisterUserState {}

class CreateUserSuccessState extends RegisterUserState {
  final RegisterEntity registerEntity;

  const CreateUserSuccessState({required this.registerEntity});

  @override
  List<Object?> get props => [registerEntity];
}

class CreateUserErrorState extends RegisterUserState {
  final String message;

  const CreateUserErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
