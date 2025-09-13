import 'package:animated_login/components/custom_elevetedbutton.dart';
import 'package:animated_login/components/custom_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginForm extends StatelessWidget {
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

  void _handleLogin() {
    HapticFeedback.lightImpact();
    Fluttertoast.showToast(msg: 'Login button pressed');
    onLoginPressed?.call();
  }

  void _handleForgotPassword() {
    HapticFeedback.lightImpact();
    Fluttertoast.showToast(msg: 'Forgot password button pressed');
    onForgotPasswordPressed?.call();
  }

  void _handleCreateAccount() {
    HapticFeedback.lightImpact();
    Fluttertoast.showToast(msg: 'Create a new account button pressed');
    onCreateAccountPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * .1),
        CustomTextField(
          iconPathName: 'profile',
          hintText: 'Enter your user name',
          isPassword: false,
          isEmail: false,
          controller: usernameController,
        ),

        SizedBox(height: 24),

        // Email Field
        CustomTextField(
          iconPathName: 'mail',
          hintText: 'Enter your email',
          isPassword: false,
          isEmail: true,
          controller: emailController,
        ),

        SizedBox(height: 24),

        // Password Field
        CustomTextField(
          iconPathName: 'password',
          hintText: 'Enter your password',
          isPassword: true,
          isEmail: false,
          controller: passwordController,
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
                isLoading: isLoading,
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
    );
  }
}
