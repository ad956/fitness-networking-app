import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void flushMesssage(BuildContext ctx, String msg) {
    showFlushbar(
      context: ctx,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: msg,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.BOTTOM,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
      )..show(ctx),
    );
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message)));
  }

  static setStatusBarColor() {}
  static setNavBarColor() {}
}

class ValidationUtils {
  static bool isValidName(String input) {
    final nameRegex = RegExp(r'^[A-Za-z ]+$');
    return nameRegex.hasMatch(input);
  }

  static bool isValidEmail(String input) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(input);
  }

  static bool isValidMobile(String input) {
    final mobileRegex =
        RegExp(r'^\d{10}$'); // Assuming a 10-digit mobile number
    return mobileRegex.hasMatch(input);
  }

  static bool containsUppercase(String input) {
    final uppercaseRegex = RegExp(r'[A-Z]');
    return uppercaseRegex.hasMatch(input);
  }

  static bool containsLowercase(String input) {
    final lowercaseRegex = RegExp(r'[a-z]');
    return lowercaseRegex.hasMatch(input);
  }

  static bool containsSpecialCharacter(String input) {
    final specialCharacterRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    return specialCharacterRegex.hasMatch(input);
  }
}
