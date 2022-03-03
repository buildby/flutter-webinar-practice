import 'package:flutter/material.dart';

class ColumnExample extends StatefulWidget {
  const ColumnExample({Key? key}) : super(key: key);

  @override
  State<ColumnExample> createState() => _ColumnExampleState();
}

class _ColumnExampleState extends State<ColumnExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff050A30),
        title: const Text('Column Example'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        alignment: Alignment.center,
        // widthFactor: ,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10, top: 10),
                height: 100,
                width: 300,
                color: Colors.black,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 100,
                width: 300,
                color: Colors.green,
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 100,
                  width: 300,
                  color: Colors.yellow),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 100,
                width: 300,
                color: Colors.pink,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 100,
                width: 300,
                color: Colors.orange,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 100,
                width: 300,
                color: Colors.red,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 80,
                width: 300,
                color: Colors.blueGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
