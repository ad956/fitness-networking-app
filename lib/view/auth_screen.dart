import 'package:fitness/view/otp_screen.dart';
import 'package:fitness/view/signin_screen.dart';
import 'package:fitness/view/signup_screen.dart';
import 'package:fitness/viewmodel/welcome_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _currentAuthSelection = context.watch<WelcomeProvider>();
    PageController pageController = PageController();

    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _currentAuthSelection.value
              ? SignUp(pageController: pageController)
              : SignIn(pageController: pageController),
          const OTPScreen()
        ],
      ),
    );
  }
}
