import 'package:flutter/material.dart';
import 'package:flutter_snippets/firebaseTodoApp/models/todomodel.dart';
import 'package:flutter_snippets/firebaseTodoApp/providers/todoprovider.dart';
import 'package:flutter_snippets/firebaseTodoApp/widget/drawer.dart';
import 'package:flutter_snippets/firebaseTodoApp/widget/new_todo.dart';
import 'package:flutter_snippets/firebaseTodoApp/widget/todo_list.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({Key? key}) : super(key: key);

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  bool isLoading = false;
  myInit() async {
    try {
      setState(() {
        isLoading = true;
      });
      await Provider.of<TodoProvider>(context, listen: false).fetchTodos();
    } catch (e) {
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    myInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final List<TodoModel> todos = Provider.of<TodoProvider>(context).todos;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff050A30),
        title: const Text('My Tasks'),
      ),
      drawer: const Drawer(
        child: AppDrawer(),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                  horizontal: deviceWidth * 0.05, vertical: deviceWidth * 0.05),
              child: Column(
                children: [...todos.map((e) => TodoList(todoModel: e))],
              ))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff050A30),
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              enableDrag: true,
              isScrollControlled: true,
              isDismissible: true,
              context: context,
              builder: (context) => const NewTodo());
        },
        isExtended: true,
      ),
    );
  }
}
