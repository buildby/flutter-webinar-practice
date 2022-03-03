import 'package:flutter/material.dart';
import 'package:flutter_snippets/bottom_nav_bar/home_page.dart';
import 'package:flutter_snippets/bottom_nav_bar/profile_page.dart';

class BottomNavigatonExample extends StatefulWidget {
  const BottomNavigatonExample({Key? key}) : super(key: key);

  @override
  State<BottomNavigatonExample> createState() => _BottomNavigatonExampleState();
}

class _BottomNavigatonExampleState extends State<BottomNavigatonExample> {
  int selectedIndex = 0;
  List<StatefulWidget> childrens = const [HomePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: childrens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: const Color(0xff050A30),
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ));
  }
}
