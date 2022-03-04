import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snippets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter_snippets/common_widgets/page_with_safearea.dart';
import 'package:flutter_snippets/common_widgets/page_without_safearea.dart';
import 'package:flutter_snippets/firebaseTodoApp/providers/authprovider.dart';
import 'package:flutter_snippets/firebaseTodoApp/providers/todoprovider.dart';
import 'package:flutter_snippets/firebaseTodoApp/screens/login_screen.dart';
import 'package:flutter_snippets/navigatons/navigation_home.dart';
import 'package:flutter_snippets/navigatons/second_page.dart';
import 'package:provider/provider.dart';
import '../animations/crossfade_animation.dart';
import '../common_widgets/button.dart';
import '../common_widgets/column.dart';
import '../common_widgets/containers.dart';
import '../common_widgets/form.dart';
import '../common_widgets/icons.dart';
import '../common_widgets/image.dart';
import '../common_widgets/row.dart';
import '../common_widgets/text.dart';
import '../gestures/gesture_detector.dart';
import '../hello_world/hello_world.dart';
import '../tabBars/tabbar_home.dart';

import 'animations/animation_with_controller.dart';
import 'animations/draggable_widget.dart';
import 'animations/opacity.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => TodoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: {
          '/second-page': (context) => const SecondPage()
        }, //Added for user named route
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20, letterSpacing: .5),
    primary: const Color(0xff050A30),
    padding: const EdgeInsets.all(10),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff050A30),
        title: const Text('Flutter Demo'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: style,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HelloWorld())),
                  child: const Text(
                    'Hello World',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: style,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PageWithSafeArea())),
                  child: const Text(
                    'SafeArea Example',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: style,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PageWithoutSafeArea())),
                  child: const Text(
                    'Without SafeArea Example',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: style,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RowExample())),
                  child: const Text(
                    'Row Example',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: style,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ColumnExample())),
                  child: const Text(
                    'Column Example',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: style,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContainerExample())),
                  child: const Text(
                    'Container Example',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: style,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ButtonExample())),
                  child: const Text(
                    'Button Example',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: style,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ImageExample())),
                  child: const Text(
                    'Image Example',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: style,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IconExample())),
                  child: const Text(
                    'Icon Example',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: style,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TextExample())),
                  child: const Text(
                    'Text & RichText Example',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: style,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FormExample())),
                  child: const Text(
                    'Form Example',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: style,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const GestureDetectorExample())),
                  child: const Text(
                    'Gesture Detector & Inkwell Example',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: style,
                  // OpacityAnimation
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OpacityAnimation())),
                  child: const Text(
                    'Animated Opacity Example',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: style,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CrossFadeAnimation())),
                  child: const Text(
                    'Animated CrossFade Example',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: style,
                  onPressed: () {},
                  child: const Text(
                    'Animated staggered Example',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: style,
                  // AnimationWithConroller
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AnimationWithConroller())),
                  child: const Text(
                    'Animated Controller Example',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: style,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DraggableWidget())),
                  child: const Text(
                    'Draggable Example',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: style,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TabBarHome())),
                  child: const Text(
                    'Tabbar Example',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: style,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const BottomNavigatonExample())),
                  child: const Text(
                    'Bottom Navigaton Example',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: style,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NavigationExample())),
                  child: const Text(
                    'Navigation Example',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: style,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen())),
                  child: const Text(
                    'Firebase Exaple',
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
