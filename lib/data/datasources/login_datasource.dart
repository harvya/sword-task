import 'dart:convert';

import 'package:sword_task/api_service_helper.dart';
import 'package:sword_task/data/models/login_model.dart';

abstract class LoginDataSource {
  Future submit(String email, String password);
}

class LoginDataSourceImpl extends LoginDataSource {
  @override
  Future submit(String email, String password) async {
    try {
      var url = 'https://reqres.in/api/login';
      var data = {"email": email, "password": password};
      var header = <String, String>{'Content-Type': 'application/json', 'x-api-key': 'reqres-free-v1'};
      var result = await ApiHelper.postRequest(url, data, header);
      if (result.toString().isNotEmpty) {
        var res = jsonDecode(result);
        if (res.toString().isNotEmpty) {
          return LoginModel.fromJson(res);
        }
      }
      throw Exception('Failed to login.');
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
