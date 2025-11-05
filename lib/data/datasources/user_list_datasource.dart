import 'dart:convert';

import 'package:sword_task/api_service_helper.dart';
import 'package:sword_task/data/models/user_list_model.dart';

abstract class UserListDataSource {
  Future getUserList(String page);
}

class UserListDataSourceImpl extends UserListDataSource {
  @override
  Future getUserList(String page) async {
    try {
      var url = 'https://reqres.in/api/users';
      final Map<String, dynamic> queryParams = {'page': page};
      final Uri uri = Uri.parse(url).replace(queryParameters: queryParams);

      var header = <String, String>{'Content-Type': 'application/json', 'x-api-key': 'reqres-free-v1'};
      var result = await ApiHelper.getRequest(uri, header);
      if (result.toString().isNotEmpty) {
        var res = jsonDecode(result);
        if (res.toString().isNotEmpty) {
          return UserListModel.fromJson(res);
        }
      }
      throw Exception('Failed to load data.');

    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
