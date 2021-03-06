import 'package:flutter/material.dart';
import '../../main.dart';
import 'package:flutter_snippets/navigatons/second_page.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({Key? key}) : super(key: key);

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff050A30),
        title: const Text('Navigation Example'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Go to Second Page with push'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondPage()));
                },
              ),
              ElevatedButton(
                child: const Text('Go to Second Page with pushNamed'),
                onPressed: () {
                  Navigator.pushNamed(context, '/second-page');
                },
              ),
              ElevatedButton(
                child: const Text('Go to Home Page with pushAndRemoveUntil'),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (route) => false);
                },
              ),
              ElevatedButton(
                child: const Text('Pop this page'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
