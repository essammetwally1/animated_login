import 'package:animated_login/screens/login_screen.dart';
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
      initialRoute: LoginScreen.routeName,
      routes: {LoginScreen.routeName: (context) => LoginScreen()},
    );
  }
}
