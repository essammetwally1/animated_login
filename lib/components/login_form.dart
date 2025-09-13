import 'package:animated_login/components/custom_elevetedbutton.dart';
import 'package:animated_login/components/custom_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController? usernameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final VoidCallback? onLoginPressed;
  final VoidCallback? onForgotPasswordPressed;
  final VoidCallback? onCreateAccountPressed;
  final bool isLoading;

  const LoginForm({
    super.key,
    this.usernameController,
    this.emailController,
    this.passwordController,
    this.onLoginPressed,
    this.onForgotPasswordPressed,
    this.onCreateAccountPressed,
    this.isLoading = false,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _handleLogin() {
    if (globalKey.currentState!.validate()) {
      HapticFeedback.lightImpact();
      Fluttertoast.showToast(msg: 'Login button pressed');
      widget.onLoginPressed?.call();
    }
  }

  void _handleForgotPassword() {
    HapticFeedback.lightImpact();
    Fluttertoast.showToast(msg: 'Forgot password button pressed');
    widget.onForgotPasswordPressed?.call();
  }

  void _handleCreateAccount() {
    HapticFeedback.lightImpact();
    Fluttertoast.showToast(msg: 'Create a new account button pressed');
    widget.onCreateAccountPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: globalKey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * .1),
            CustomTextField(
              iconPathName: 'profile',
              hintText: 'Enter your user name',
              isPassword: false,
              isEmail: false,
              controller: widget.usernameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Your Name';
                } else {
                  return null;
                }
              },
            ),

            SizedBox(height: 24),

            // Email Field
            CustomTextField(
              iconPathName: 'mail',
              hintText: 'Enter your email',
              isPassword: false,
              isEmail: true,
              controller: widget.emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter e-mail';
                } else if (!value.contains('@gmail.com')) {
                  return 'Enter valid e-mail';
                } else {
                  return null;
                }
              },
            ),

            SizedBox(height: 24),

            // Password Field
            CustomTextField(
              iconPathName: 'password',
              hintText: 'Enter your password',
              isPassword: true,
              isEmail: false,
              controller: widget.passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter password';
                } else if (value.length < 9) {
                  return 'Enter valid password -more than 9 letters-';
                } else {
                  return null;
                }
              },
            ),

            SizedBox(height: 24),

            // Login & Forgot Password Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomElevetedButton(
                    text: 'Login',
                    onPressed: _handleLogin,
                    isLoading: widget.isLoading,
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: CustomElevetedButton(
                    text: 'Forgot password!',
                    onPressed: _handleForgotPassword,
                  ),
                ),
              ],
            ),

            SizedBox(height: 24),

            // Create Account Button
            CustomElevetedButton(
              text: 'Create a new Account',
              onPressed: _handleCreateAccount,
            ),
          ],
        ),
      ),
    );
  }
}
