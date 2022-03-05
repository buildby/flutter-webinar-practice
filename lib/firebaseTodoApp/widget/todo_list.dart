import 'package:flutter/material.dart';
import 'package:flutter_snippets/firebaseTodoApp/models/todomodel.dart';
import 'package:flutter_snippets/firebaseTodoApp/providers/authprovider.dart';
import 'package:flutter_snippets/firebaseTodoApp/providers/todoprovider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {
  final TodoModel todoModel;
  const TodoList({Key? key, required this.todoModel}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  showDeleteAlertDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete'),
        content: Text('Are sure want to delete ${widget.todoModel.title}'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                Provider.of<TodoProvider>(context, listen: false).deleteTodo(
                    taskId: widget.todoModel.id,
                    token: Provider.of<AuthProvider>(context, listen: false)
                        .userModel
                        .token);
              },
              child: const Text('Yes')),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(2, 2)),
          ],
          // border: Border.all(),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(bottom: deviceWidth * 0.08),
      child: Row(
        children: [
          InkWell(
            onTap: () async {
              await Provider.of<TodoProvider>(context, listen: false)
                  .toggleMarkTodo(
                      token: Provider.of<AuthProvider>(context, listen: false)
                          .userModel
                          .token,
                      taskId: widget.todoModel.id,
                      isCompleted: widget.todoModel.isCompleted);
            },
            child: Container(
              margin: EdgeInsets.only(right: deviceWidth * 0.05),
              child: const Icon(
                Icons.check,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: widget.todoModel.isCompleted
                            ? Colors.black12
                            : Colors.transparent,
                        blurRadius: 2,
                        spreadRadius: 2,
                        offset: Offset(4, 4)),
                  ],
                  borderRadius: BorderRadius.circular(5),
                  color: widget.todoModel.isCompleted
                      ? const Color(0xff050A30)
                      : Colors.transparent,
                  border: Border.all(color: const Color(0xff050A30))),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: deviceWidth * 0.64,
                child: Text(
                  widget.todoModel.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .56,
                  ),
                ),
              ),
              SizedBox(
                height: deviceWidth * 0.01,
              ),
              Text(
                DateFormat(
                  'dd-MMM-yyyy hh:mm a',
                ).format(widget.todoModel.createdAt),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: .56,
                ),
              )
            ],
          ),
          InkWell(
              onTap: () {
                showDeleteAlertDialog();
              },
              child: const Icon(
                Icons.delete_rounded,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
