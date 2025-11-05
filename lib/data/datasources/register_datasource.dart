import 'dart:convert';

import 'package:sword_task/api_service_helper.dart';
import 'package:sword_task/data/models/register_model.dart';

abstract class RegisterUserDataSource {
  Future registerUser(String email, String password);
}

class RegisterUserDataSourceImpl extends RegisterUserDataSource {
  @override
  Future registerUser(String email, String password) async {
    try {
      var url = 'https://reqres.in/api/register';
      var data = {"email": email, "password": password};
      var header = <String, String>{'Content-Type': 'application/json', 'x-api-key': 'reqres-free-v1'};
      var result = await ApiHelper.postRequest(url, data, header);
      if (result.toString().isNotEmpty) {
        var res = jsonDecode(result);
        if (res.toString().isNotEmpty) {
          return RegisterModel.fromJson(res);
        }
      }
      throw Exception('Registration failed due to empty response.');
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
