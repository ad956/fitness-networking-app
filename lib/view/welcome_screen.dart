import 'dart:async';
import 'package:fitness/core/routes/routes_config.dart';
import 'package:fitness/core/routes/routes_constants.dart';
import 'package:fitness/view/widgets/welcome_screen_widgets/welcome_widgets.dart';
import 'package:fitness/viewmodel/welcome_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;
  final int _totalPages = 4;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < _totalPages - 1) {
        _pageController.animateToPage(_currentPage + 1,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
        _currentPage = _currentPage + 1;
      } else {
        _pageController.animateToPage(0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _currentAuthSelection = context.watch<WelcomeProvider>();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  welcome(_pageController),
                  gym(_pageController),
                  connect(_pageController),
                  track(context, _pageController),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () =>
                      AppRouter.goto(context, RouteNames.selectRoleRoute),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff6b29ff), //6b29ff
                      fixedSize: Size(300, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Get Started",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          textStyle: const TextStyle(fontSize: 15),
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        textStyle: const TextStyle(fontSize: 12),
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      _currentAuthSelection.value = false;
                      AppRouter.goto(context, RouteNames.selectRoleRoute);
                    },
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          textStyle: const TextStyle(fontSize: 12),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
