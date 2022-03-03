import 'package:flutter/material.dart';

class RowExample extends StatefulWidget {
  const RowExample({Key? key}) : super(key: key);

  @override
  State<RowExample> createState() => _RowExampleState();
}

class _RowExampleState extends State<RowExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff050A30),
        title: const Text('Row Example'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        // widthFactor: ,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 80,
                width: 80,
                color: Colors.black,
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 80,
                width: 80,
                color: Colors.green,
              ),
              Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 80,
                  width: 80,
                  color: Colors.yellow),
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 80,
                width: 80,
                color: Colors.pink,
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 80,
                width: 80,
                color: Colors.orange,
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 80,
                width: 80,
                color: Colors.red,
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 80,
                width: 80,
                color: Colors.blueGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
