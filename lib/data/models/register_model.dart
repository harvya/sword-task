import 'package:sword_task/domain/entities/register_enitity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel({required super.id, required super.token});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(id: json["id"], token: json["token"]);
}
