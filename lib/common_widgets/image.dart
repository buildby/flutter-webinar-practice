import 'package:flutter/material.dart';

class ImageExample extends StatefulWidget {
  const ImageExample({Key? key}) : super(key: key);

  @override
  State<ImageExample> createState() => _ImageExampleState();
}

class _ImageExampleState extends State<ImageExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff050A30),
        title: const Text('Image Example'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        alignment: Alignment.center,
        // widthFactor: ,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              margin: const EdgeInsets.only(bottom: 10),
              height: 200,
              width: 200,
              child: Image.asset(
                'assets/images/catImage.jpg',
                fit: BoxFit.contain,
              ),
            ),
            const Text(
              'Asset Image',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 200,
              width: 200,
              child: Image.network('https://picsum.photos/200/200'),
              decoration: BoxDecoration(border: Border.all()),
            ),
            const Text(
              'Network Image',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
