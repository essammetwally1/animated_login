import 'package:animated_login/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AnimatedLogin());
}

class AnimatedLogin extends StatelessWidget {
  const AnimatedLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {HomeScreen.routeName: (context) => HomeScreen()},
    );
  }
}
