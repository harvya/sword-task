import 'package:sword_task/domain/entities/user_list_entity.dart';

class UserListModel extends UserListEntity {
  const UserListModel({required super.page, required super.perPage, required super.total, required super.totalPages, required super.data});

  factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
    page: json["page"],
    perPage: json["per_page"],
    total: json["total"],
    totalPages: json["total_pages"],
    data: List<DatumModel>.from(json["data"].map((x) => DatumModel.fromJson(x))),
  );
}

class DatumModel extends DatumEntity {
const  DatumModel({required super.id, required super.email, required super.firstName, required super.lastName, required super.avatar});

  factory DatumModel.fromJson(Map<String, dynamic> json) =>
      DatumModel(id: json["id"], email: json["email"], firstName: json["first_name"], lastName: json["last_name"], avatar: json["avatar"]);
}
