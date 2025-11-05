import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => [];
}

class UnknownFailure extends Failure {
  const UnknownFailure(String message) : super(message: message);
}
