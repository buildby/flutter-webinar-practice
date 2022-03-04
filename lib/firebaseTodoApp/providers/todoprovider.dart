import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_snippets/api.dart';
import 'package:flutter_snippets/firebaseTodoApp/models/todomodel.dart';
import 'package:http/http.dart' as http;

class TodoProvider with ChangeNotifier {
  static const Map<String, String> header = {
    "Content-Type": "application/json"
  };
  List<TodoModel> todos = [
    TodoModel(
        id: '1',
        createdAt: DateTime.now(),
        isCompleted: false,
        title:
            'Learn flutter Learn flutter Learn flutter Learn flutter Learn flutter Learn flutter Learn flutter Learn flutter Learn flutter Learn flutter Learn flutter  '),
    TodoModel(
        id: '2', createdAt: DateTime.now(), isCompleted: true, title: 'Node JS')
  ];

  fetchTodos() async {
    try {
      // final response  = await http.get()
    } catch (e) {}
  }

  createTodo(
      {required String uid,
      required String title,
      bool isCompleted = false,
      required String token}) async {
    try {
      final response = await http.post(
          Uri.parse('${webApi['domain']}${endPoints['todo']}?auth=$token'),
          body: json.encode({
            'uid': uid,
            'title': title,
            'createdAt': DateTime.now().toIso8601String(),
            'isCompleted': false
          }),
          headers: header);

      final responseData = json.decode(response.body);

      todos.insert(
          0,
          TodoModel(
              id: '3',
              createdAt: DateTime.now(),
              isCompleted: false,
              title: title));
      notifyListeners();

      print(response);
    } catch (e) {}
  }

  toggleMarkTodo() async {}
  deleteTodo() async {}
}
