import 'package:flutter/material.dart';

class TabBarPage2 extends StatefulWidget {
  const TabBarPage2({Key? key}) : super(key: key);

  @override
  State<TabBarPage2> createState() => _TabBarPage2State();
}

class _TabBarPage2State extends State<TabBarPage2> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Tab 2',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
