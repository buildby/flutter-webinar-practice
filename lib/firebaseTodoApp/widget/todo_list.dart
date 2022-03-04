import 'package:flutter/material.dart';
import 'package:flutter_snippets/firebaseTodoApp/models/todomodel.dart';
import 'package:intl/intl.dart';

class TodoList extends StatefulWidget {
  final TodoModel todoModel;
  const TodoList({Key? key, required this.todoModel}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
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
          Container(
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
          InkWell(onTap: () {}, child: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
