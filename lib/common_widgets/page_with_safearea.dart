import 'package:flutter/material.dart';

class PageWithSafeArea extends StatefulWidget {
  const PageWithSafeArea({Key? key}) : super(key: key);

  @override
  State<PageWithSafeArea> createState() => _PageWithSafeAreaState();
}

class _PageWithSafeAreaState extends State<PageWithSafeArea> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Text("Good....... You used safearea"),
      ),
    );
  }
}
