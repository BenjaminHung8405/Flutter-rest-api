import 'dart:convert';
import 'package:flutter_rest_api/models/user.dart';
import 'package:flutter_rest_api/models/user_name.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rest_api/models/environment.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    var url = Environment.apiUrl;
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['results'] as List<dynamic>;
    final users = result.map((e) {
      final name = UserName(
        title: e['name']['title'], 
        lastName: e['name']['last'],  
        firstName: e['name']['first']
        );

      return User(
        email: e['email'],
        name: name, 
        gender: e['gender'],
        phone: e['phone'],
      );
    }).toList();
    return users;
  }
}