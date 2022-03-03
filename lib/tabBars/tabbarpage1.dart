import 'package:flutter/material.dart';

class TabBarPage1 extends StatefulWidget {
  const TabBarPage1({Key? key}) : super(key: key);

  @override
  State<TabBarPage1> createState() => _TabBarPage1State();
}

class _TabBarPage1State extends State<TabBarPage1> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Tab 1',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
