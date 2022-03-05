import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_snippets/api.dart';
import 'package:flutter_snippets/firebaseTodoApp/models/todomodel.dart';
import 'package:http/http.dart' as http;

class TodoProvider with ChangeNotifier {
  static const Map<String, String> header = {
    "Content-Type": "application/json"
  };
  List<TodoModel> todos = [];

  setTodoToEmpty() {
    todos = [];
    // notifyListeners();
  }

  fetchTodos({
    required String token,
    required String uid,
  }) async {
    try {
      todos = [];
      // notifyListeners();
      String url =
          '${webApi['domain']}${endPoints['todojson']}?auth=$token&orderBy="uid"&equalTo="$uid"';

      final response = await http.get(Uri.parse(url), headers: header);
      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        return responseData;
      } else {
        responseData.forEach((id, value) {
          todos.add(TodoModel(
              id: id,
              createdAt: DateTime.parse(responseData[id]['createdAt']),
              isCompleted: responseData[id]['isCompleted'],
              title: responseData[id]['title']));
        });
        notifyListeners();
      }

      // print(responseData);
    } catch (e) {
      rethrow;
    }
  }

  createTodo(
      {required String uid,
      required String title,
      bool isCompleted = false,
      required String token}) async {
    try {
      final response = await http.post(
          Uri.parse('${webApi['domain']}${endPoints['todojson']}?auth=$token'),
          body: json.encode({
            'uid': uid,
            'title': title,
            'createdAt': DateTime.now().toIso8601String(),
            'isCompleted': false
          }),
          headers: header);

      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        return responseData;
      } else {
        todos.insert(
            0,
            TodoModel(
                id: responseData['name'],
                createdAt: DateTime.now(),
                isCompleted: false,
                title: title));
        notifyListeners();
      }
      debugPrint(response.toString());
    } catch (e) {
      rethrow;
    }
  }

  toggleMarkTodo({
    required String token,
    required String taskId,
    required bool isCompleted,
  }) async {
    try {
      for (var todo in todos) {
        if (todo.id == taskId) {
          todo.isCompleted = !isCompleted;
        }
      }
      notifyListeners();
      final String url =
          '${webApi['domain']}${endPoints['todo']}/$taskId.json?auth=$token';

      final response = await http.patch(Uri.parse(url),
          body: json.encode({'isCompleted': !isCompleted}), headers: header);

      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        for (var todo in todos) {
          if (todo.id == taskId) {
            todo.isCompleted = isCompleted;
          }
        }
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  deleteTodo({required String taskId, required String token}) async {
    todos.removeWhere((todo) => todo.id == taskId);
    notifyListeners();

    final String url =
        '${webApi['domain']}${endPoints['todo']}/$taskId.json?auth=$token';

    final response = await http.delete(Uri.parse(url), headers: header);

    debugPrint(response.toString());

    // final responseData = json.decode(response.body);
  }
}
