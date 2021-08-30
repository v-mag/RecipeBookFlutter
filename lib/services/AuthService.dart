import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<bool> userExist(String username) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:5000/find/$username'));
    if(response.statusCode == 200) {
      return true;
    } else if(response.statusCode == 204) {
      return false;
    } else {
      throw Exception('Failed to get user');
    }
  }

  Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/User/authenticate'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({'username' : username, 'password': password})
    );

    if(response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = jsonDecode(response.body)["token"];
      prefs.setString("token", token);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> register(String username, String password) async {
    final response = await http.post(
        Uri.parse('http://10.0.2.2:5000/User/register'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({'username' : username, 'password': password})
    );

    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}