import 'package:flutter/material.dart';
import 'package:flutter_snippets/firebaseTodoApp/providers/authprovider.dart';
import 'package:flutter_snippets/firebaseTodoApp/providers/todoprovider.dart';
import 'package:provider/provider.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({Key? key}) : super(key: key);

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController task = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + deviceWidth * 0.2,
        right: deviceWidth * 0.05,
        left: deviceWidth * 0.05,
      ),
      child: Form(
        key: _formKey,
        child: Wrap(
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: deviceWidth * 0.05),
                child: const Text(
                  'Enter Your task here',
                  style: TextStyle(
                    color: Color(0xff050A30),
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    letterSpacing: 1.4,
                  ),
                )),
            TextFormField(
              controller: task,
              decoration: const InputDecoration(
                labelText: 'Task',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff050A30), width: 0.5),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff050A30), width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff050A30), width: 0.5),
                ),
              ),
              maxLines: null,
              validator: (val) {
                if (val!.trim().isEmpty) {
                  return 'Please enter task';
                }
              },
            ),
            Container(
              height: deviceWidth * 0.05,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                      print(task.text);
                      await Provider.of<TodoProvider>(context, listen: false)
                          .createTodo(
                              uid: Provider.of<AuthProvider>(context,
                                      listen: false)
                                  .userModel
                                  .uid,
                              title: task.text,
                              token: Provider.of<AuthProvider>(context,
                                      listen: false)
                                  .userModel
                                  .token);
                    }
                  },
                  child: const Icon(Icons.check, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                    primary: const Color(0xff050A30), // <-- Button color
                    onPrimary: Colors.red, // <-- Splash color
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
