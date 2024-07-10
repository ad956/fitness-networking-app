import 'package:fitness/core/routes/routes_constants.dart';
import 'package:fitness/view/auth_screen.dart';
import 'package:fitness/view/home_screen.dart';
import 'package:fitness/view/select_role.dart';
import 'package:fitness/view/welcome_screen.dart';
import 'package:fitness/view/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> genrateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.splashRoute:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RouteNames.welcomeRoute:
        return MaterialPageRoute(builder: (context) => WelcomeScreen());
      case RouteNames.selectRoleRoute:
        return MaterialPageRoute(builder: (context) => SelectRole());
      case RouteNames.authRoute:
        return MaterialPageRoute(builder: (context) => AuthScreen());
      case RouteNames.homeRoute:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => HomeScreen());
    }
  }

  static Future<dynamic> goto(BuildContext ctx, String routeName) {
    return Navigator.pushNamed(ctx, routeName);
  }
}
