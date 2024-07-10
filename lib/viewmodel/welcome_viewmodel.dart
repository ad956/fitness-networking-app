import 'package:flutter/material.dart';

// true => goes for signup, false => signIn
class WelcomeProvider extends ValueNotifier<bool> {
  WelcomeProvider(bool signIn) : super(signIn);
}
