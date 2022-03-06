import 'package:flutter/material.dart';
import 'package:flutter_snippets/main.dart';
import 'package:flutter_snippets/firebaseTodoApp/providers/authprovider.dart';
import 'package:flutter_snippets/firebaseTodoApp/providers/todoprovider.dart';
import 'package:flutter_snippets/firebaseTodoApp/screens/login_screen.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final userModel = Provider.of<AuthProvider>(context).userModel;

    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: deviceWidth * 0.02),
        width: deviceWidth * .8,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('gdhshjds'),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: deviceWidth * 0.1,
                  ),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xff050A30)),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(20),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  margin: EdgeInsets.symmetric(horizontal: deviceWidth * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, ' + userModel.name.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(userModel.email,
                          style: const TextStyle(letterSpacing: 0.5)),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () async {
                  await Provider.of<AuthProvider>(context, listen: false)
                      .logout();

                  Provider.of<TodoProvider>(context, listen: false)
                      .setTodoToEmpty();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                      (route) => false);
                },
                child: const Text('Logout'),
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerLeft),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (route) => false);
                },
                child: const Text('Goto Demo App'),
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerLeft),
              ),
            )
          ],
        ),
      ),
    );
  }
}
