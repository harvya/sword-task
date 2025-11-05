import 'package:equatable/equatable.dart';
import 'package:sword_task/domain/entities/login_entity.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {}

class SubmitInitialState extends LoginState {}

class SubmitSuccessState extends LoginState {
  final LoginEntity loginEntity;

  const SubmitSuccessState({required this.loginEntity});

  @override
  List<Object?> get props => [loginEntity];
}

class SubmitErrorState extends LoginState {
  final String message;

  const SubmitErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
