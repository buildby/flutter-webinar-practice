import 'package:flutter/material.dart';

class AnimationWithConroller extends StatefulWidget {
  const AnimationWithConroller({Key? key}) : super(key: key);

  @override
  State<AnimationWithConroller> createState() => _AnimationWithConrollerState();
}

class _AnimationWithConrollerState extends State<AnimationWithConroller>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> heightAnimation;

  late AnimationController _colorController;
  late Animation colorAnimation;

  late AnimationController _offsetController;
  late Animation<Offset> offsetAnimation;

  // late AnimationController _offsetYaxisController;
  late Animation<Offset> offsetYaxisAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _colorController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _offsetController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    heightAnimation = Tween<double>(begin: 100, end: 200).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    colorAnimation = ColorTween(begin: Colors.black, end: Colors.red)
        .animate(_colorController)
      ..addListener(() {
        setState(() {});
      });

    offsetAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 100))
            .animate(_offsetController)
          ..addListener(() {
            setState(() {});
          });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff050A30),
        title: const Text('Animation with Controller'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (_controller.isCompleted) {
                    _controller.reverse();
                  } else {
                    _controller.forward();
                  }
                },
                child: Container(
                  height: heightAnimation.value,
                  width: 200,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (_colorController.isCompleted) {
                    _colorController.reverse();
                  } else {
                    _colorController.forward();
                  }
                },
                child: Container(
                  height: 200,
                  width: 200,
                  color: colorAnimation.value,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (_offsetController.isCompleted) {
                    _offsetController.reverse();
                  } else {
                    _offsetController.forward();
                  }
                },
                child: Transform.translate(
                  offset: offsetAnimation.value,
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.amber,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
