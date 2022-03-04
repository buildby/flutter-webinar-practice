import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_snippets/api.dart';
import 'package:flutter_snippets/firebaseTodoApp/models/userModel.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  final LocalStorage storage = LocalStorage('flutter-snippets');
  static const Map<String, String> header = {
    "Content-Type": "application/json"
  };
  late UserModel userModel;

  logIn() async {}

  signUp(
      {required String name,
      required String email,
      required String password}) async {
    final response = await http.post(Uri.parse(authEndPoints['signup']!),
        body: json.encode({'email': email, 'password': password}),
        headers: header);

    print(response);
  }

  userLoginCheck() async {
    final userDetails = storage.getItem('user');
    logIn();
  }
}
