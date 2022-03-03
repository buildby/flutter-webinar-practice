import 'package:flutter/material.dart';

class TextExample extends StatefulWidget {
  const TextExample({Key? key}) : super(key: key);

  @override
  State<TextExample> createState() => _TextExampleState();
}

class _TextExampleState extends State<TextExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff050A30),
        title: const Text('Text & Rich Text Example'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        // widthFactor: ,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Text Example',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
              const Divider(
                height: 10,
              ),
              const Text(
                'Rich Example',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              RichText(
                text: const TextSpan(
                  text: "Hello",
                  children: [
                    TextSpan(
                        text: ' I am Bold',
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    TextSpan(
                      text: ' My font size is 22',
                      style: TextStyle(fontSize: 22),
                    ),
                    TextSpan(
                        text: ' I am italic',
                        style: TextStyle(fontStyle: FontStyle.italic)),
                    TextSpan(
                        text: ' I am italic and large',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 22))
                  ],
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
