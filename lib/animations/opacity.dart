import 'package:flutter/material.dart';

class OpacityAnimation extends StatefulWidget {
  const OpacityAnimation({Key? key}) : super(key: key);

  @override
  State<OpacityAnimation> createState() => _OpacityAnimationState();
}

class _OpacityAnimationState extends State<OpacityAnimation> {
  double currentopacity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff050A30),
        title: const Text('Opacity'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (currentopacity == 0) {
                  currentopacity = 1;
                  return;
                }
                currentopacity = 0;
              });
            },
            child: Container(
              alignment: Alignment.center,
              child: AnimatedOpacity(
                curve: Curves.easeInOut,
                opacity: currentopacity,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Text(
            currentopacity == 0 ? "I'am invisible" : "I'am visible",
            style: TextStyle(
                color: currentopacity == 0 ? Colors.red : Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
