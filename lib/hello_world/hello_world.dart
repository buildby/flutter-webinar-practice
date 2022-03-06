import 'package:flutter/material.dart';

class HelloWorld extends StatefulWidget {
  const HelloWorld({Key? key}) : super(key: key);

  @override
  State<HelloWorld> createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff050A30),
        title: const Text('Hello World'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text(
            'Hello World In flutter ...Dev',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
