import 'package:flutter/material.dart';
import '../tabBars/tabbarpage1.dart';
import '../tabBars/tabbarpage2.dart';

class TabBarHome extends StatefulWidget {
  const TabBarHome({Key? key}) : super(key: key);

  @override
  State<TabBarHome> createState() => _TabBarHomeState();
}

class _TabBarHomeState extends State<TabBarHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff050A30),
          title: const Text('Tab Bar Example'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.contacts), text: "Tab 1"),
              Tab(icon: Icon(Icons.camera_alt), text: "Tab 2")
            ],
          ),
        ),
        body: const TabBarView(children: [
          TabBarPage1(),
          TabBarPage2(),
        ]),
      ),
    );
  }
}
