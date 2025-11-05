import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final int id;
  final String token;

  const RegisterEntity({required this.id, required this.token});

  @override
  List<Object?> get props => [id, token];
}
