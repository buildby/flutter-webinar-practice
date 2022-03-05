import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_snippets/api.dart';
import 'package:flutter_snippets/firebaseTodoApp/models/user_model.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  final LocalStorage storage = LocalStorage('flutter-snippets');
  static const Map<String, String> header = {
    "Content-Type": "application/json"
  };
  late UserModel userModel;

  logIn({required String email, required String password}) async {
    try {
      final response = await http.post(Uri.parse(authEndPoints['login']!),
          body: json.encode({
            'email': email,
            'password': password,
            "returnSecureToken": true
          }),
          headers: header);
      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        return responseData;
      } else {
        await getUserDetails(
            token: responseData['idToken'], uid: responseData['localId']);

        // userModel =  UserModel(email: email, token: token, name: name)
      }
    } catch (e) {
      rethrow;
    }
  }

  signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final response = await http.post(Uri.parse(authEndPoints['signup']!),
          body: json.encode({'email': email, 'password': password}),
          headers: header);

      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        return responseData;
      } else {
        enterUserDetails(
            name: name,
            email: email,
            uid: responseData['localId'],
            token: responseData['idToken']);
        return;
      }
    } catch (e) {
      rethrow;
    }
  }

  enterUserDetails(
      {required String name,
      required String email,
      required String uid,
      required String token}) async {
    final response = await http.post(
        Uri.parse('${webApi['domain']}${endPoints['user']}?auth=$token'),
        body: json.encode({'name': name, 'email': email, 'uid': uid}),
        headers: header);
    final responseData = json.decode(response.body);
    if (responseData['error'] != null) {
      return responseData;
    } else {
      userModel = UserModel(email: email, token: token, name: name, uid: uid);
      storage.setItem('tokenAndId', json.encode({'token': token, 'uid': uid}));
      notifyListeners();
    }
  }

  getUserDetails({
    required String token,
    required String uid,
  }) async {
    try {
      String url =
          '${webApi['domain']}${endPoints['user']}?auth=$token&orderBy="uid"&equalTo="$uid"';

      final response = await http.get(Uri.parse(url), headers: header);
      final responseData = json.decode(response.body);

      print(responseData);
      userModel = UserModel(
          email: responseData[responseData.keys.first]['email'],
          token: token,
          name: responseData[responseData.keys.first]['name'],
          uid: uid);
      print(userModel);
      storage.setItem('tokenAndId', json.encode({'token': token, 'uid': uid}));
      final userDetails = await storage.getItem('tokenAndId');
      print(userDetails);
    } catch (e) {
      rethrow;
    }
  }

  userLoginCheck() async {
    final userDetails = await storage.getItem('tokenAndId');
    if (userDetails != null) {
      final decodedJson = json.decode(userDetails);

      // logIn();

      await getUserDetails(
          token: decodedJson['token'], uid: decodedJson['uid']);
      return true;
    } else {
      return false;
    }
  }

  logout() async {
    await storage.deleteItem('tokenAndId');
  }
}
