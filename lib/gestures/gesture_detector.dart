import 'package:flutter/material.dart';

class GestureDetectorExample extends StatefulWidget {
  const GestureDetectorExample({Key? key}) : super(key: key);

  @override
  State<GestureDetectorExample> createState() => _GestureDetectorExampleState();
}

class _GestureDetectorExampleState extends State<GestureDetectorExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff050A30),
        title: const Text('Gesture Detector & Inkwell Example'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Text is clicked of gesture detector'),
                  duration: Duration(seconds: 1),
                ));
              },
              child: const Text("I'am Text with gesture detector"),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Text is clicked with inkwell'),
                  duration: Duration(seconds: 1),
                ));
              },
              child: const Text("I'am Text with Inkwell"),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("I'am yellow box"),
                  duration: Duration(seconds: 1),
                ));
              },
              child: Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}
