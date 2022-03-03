import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  const DraggableWidget({Key? key}) : super(key: key);

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  int acceptedData = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff050A30),
        title: const Text('Draggable Example'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Draggable<int>(
              // Data is the value this Draggable stores.
              data: 10,
              feedback: Container(
                color: Colors.deepOrange,
                height: 100,
                width: 100,
                child: const Icon(Icons.directions_run),
              ),
              childWhenDragging: Container(
                alignment: Alignment.center,
                height: 100.0,
                width: 100.0,
                color: Colors.pinkAccent,
                child: const Center(
                  child: Text('Child When Dragging'),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                height: 100.0,
                width: 100.0,
                color: Colors.lightGreenAccent,
                child: const Center(
                  child: Text('Draggable'),
                ),
              ),
            ),
            DragTarget<int>(
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return Container(
                  alignment: Alignment.center,
                  height: 100.0,
                  width: 100.0,
                  color: Colors.cyan,
                  child: Center(
                    child: Text('Value is updated to: $acceptedData'),
                  ),
                );
              },
              onAccept: (int data) {
                setState(() {
                  acceptedData += data;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
