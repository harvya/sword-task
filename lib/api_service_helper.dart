import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper {
  static var ioClient = http.Client();

  static Future<dynamic> postRequest(String endpoint, dynamic data, Map<String, String> header) async {
    try {
      final response = await ioClient.post(Uri.parse(endpoint), headers: header, body: json.encode(data));
      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 400) {
        print('Status Code: 400 - Bad Request');
        throw Exception('Bad Request');
      } else {
        print(response.statusCode.toString());
        throw Exception('Failed to load Post Data');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<dynamic> getRequest(Uri uri, Map<String, String> header) async {
    try {
      final response = await ioClient.get(uri, headers: header);
      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 400) {
        print('Status Code: 400 - Bad Request');
        throw Exception('Bad Request');
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
