import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormExample extends StatefulWidget {
  const FormExample({Key? key}) : super(key: key);

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff050A30),
        title: const Text('Form Example'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Enter Your Name',
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff050A30), width: 0.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff050A30), width: 0.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff050A30), width: 0.0),
                  ),
                ),
                validator: (value) {
                  if (value == '') return 'Please Enter Your name';
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: ageController,
                decoration: const InputDecoration(
                  labelText: 'Enter age',
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff050A30), width: 0.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff050A30), width: 0.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff050A30), width: 0.0),
                  ),
                ),
                validator: (value) {
                  if (value == '') return 'Please Enter Your age';
                  if (int.tryParse(value!) == null) {
                    return 'Please Enter a valid age';
                  }
                },
              ),
              const SizedBox(
                height: 200,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16, letterSpacing: .5),
                    primary: const Color(0xff050A30),
                    padding: const EdgeInsets.all(14),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Form is submitted'),
                        duration: Duration(seconds: 1),
                      ));
                      setState(() {
                        nameController.text = '';
                        ageController.text = '';
                      });
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontWeight: FontWeight.w500),
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
