import 'package:flutter/material.dart';

class CrossFadeAnimation extends StatefulWidget {
  const CrossFadeAnimation({Key? key}) : super(key: key);

  @override
  State<CrossFadeAnimation> createState() => _CrossFadeAnimationState();
}

class _CrossFadeAnimationState extends State<CrossFadeAnimation> {
  bool firstChild = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff050A30),
        title: const Text('Cross Fade Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (firstChild) {
                    firstChild = false;
                  } else {
                    firstChild = true;
                  }
                });
              },
              child: AnimatedCrossFade(
                firstChild: Container(
                  height: 200,
                  width: 200,
                  color: Colors.red,
                ),
                secondChild: Container(
                  height: 200,
                  width: 200,
                  color: Colors.blue,
                ),
                crossFadeState: firstChild
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 600),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Touch Container for change colour',
              style: TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
