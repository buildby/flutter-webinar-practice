import 'package:flutter/material.dart';
import 'package:flutter_snippets/firebaseTodoApp/providers/authprovider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String authAction = 'login';
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmail(String string) {
    // Null or empty string is invalid
    if (string == null || string.isEmpty) {
      return false;
    }

    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(string)) {
      return false;
    }
    return true;
  }

  formSubmit() async {
    if (_formKey.currentState!.validate()) {
      // debugPrint('Valid');
      if (authAction == 'login') {
        Provider.of<AuthProvider>(context, listen: false).logIn();
      } else {
        Provider.of<AuthProvider>(context, listen: false).signUp(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text);
      }
    } else {
      return;
    }
  }

  myInit() async {
    Provider.of<AuthProvider>(context, listen: false).userLoginCheck();
  }

  @override
  void initState() {
    myInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xff050A30),
        title: const Text('To-do Firebase'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(deviceWidth * 0.05),
              margin: EdgeInsets.symmetric(horizontal: deviceWidth * 0.1),
              decoration: const BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    colors: [Color(0xfff5e3e6), Color(0xff89d4cf)]),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(4, 4)),
                ],
              ),
              // height: deviceWidth * 0.8,
              width: deviceWidth * 0.9,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        authAction == 'login' ? 'Login' : 'Sign-up',
                        style: TextStyle(
                          fontSize: textScaleFactor * 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff050A30),
                        ),
                      ),
                      margin: EdgeInsets.only(bottom: deviceWidth * 0.05),
                    ),
                    if (authAction == 'signup')
                      Column(
                        children: [
                          SizedBox(
                            // margin: EdgeInsets.only(bottom: deviceWidth * 0.05),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: nameController,
                              decoration: const InputDecoration(
                                labelText: 'Enter your name',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: .56),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff050A30), width: 0.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff050A30), width: 0.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff050A30), width: 0.0),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter valid name';
                                }
                              },
                              // onChanged: (value) {
                              //   _formKey.currentState!.validate();
                              // },
                            ),
                          ),
                        ],
                      ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: deviceWidth * 0.05),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Enter your e-mail address',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.w500, letterSpacing: .56),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff050A30), width: 0.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff050A30), width: 0.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff050A30), width: 0.0),
                          ),
                        ),
                        validator: (value) {
                          if (!isEmail(value!)) {
                            return 'Please Enter valid Email';
                          }
                        },
                        // onChanged: (value) {
                        //   _formKey.currentState!.validate();
                        // },
                      ),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      controller: passwordController,
                      cursorHeight: 22,
                      decoration: const InputDecoration(
                        labelText: 'Enter your password',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: .56,
                        ),
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
                        if (value == '') return 'Please enter a password';
                        if (value!.length < 6) {
                          return 'Please enter password more than 6 characters';
                        }
                      },
                      // onChanged: (value) => _formKey.currentState!.validate(),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: TextButton.icon(
                          onPressed: () {
                            if (authAction == 'login') {
                              setState(() {
                                authAction = 'signup';
                              });
                            } else {
                              setState(() {
                                authAction = 'login';
                              });
                            }
                          },
                          icon: Icon(Icons.person),
                          label: Text(authAction == 'login'
                              ? 'Create new account'
                              : 'Already user login')),
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(
                  top: deviceWidth * 0.1, right: deviceWidth * 0.1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      textStyle:
                          const TextStyle(fontSize: 20, letterSpacing: .5),
                      primary: const Color(0xff050A30),
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceWidth * 0.1,
                          vertical: deviceWidth * 0.04),
                    ),
                    icon: const Icon(Icons.arrow_back),
                    label: Text(
                      authAction == 'login' ? 'Login' : 'Create new account',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: textScaleFactor * 16),
                    ),
                    onPressed: formSubmit,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
