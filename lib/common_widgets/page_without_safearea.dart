import 'package:flutter/material.dart';

class PageWithoutSafeArea extends StatefulWidget {
  const PageWithoutSafeArea({Key? key}) : super(key: key);

  @override
  State<PageWithoutSafeArea> createState() => _PageWithoutSafeAreaState();
}

class _PageWithoutSafeAreaState extends State<PageWithoutSafeArea> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("To avoid this please use safearea"),
    );
  }
}
