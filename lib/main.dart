import 'package:fitness/core/routes/routes_config.dart';
import 'package:fitness/core/routes/routes_constants.dart';
import 'package:fitness/viewmodel/roles_viewmodel.dart';
import 'package:fitness/viewmodel/welcome_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RolesProvider(true)),
        ChangeNotifierProvider(create: (context) => WelcomeProvider(true)),
      ],
      child: MaterialApp(
        title: 'Fitness Networking',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   primaryColor: Color(0xff6b29ff),
        // ),
        onGenerateRoute: AppRouter.genrateRoute,
        initialRoute: RouteNames.homeRoute,
      ),
    );
  }
}
