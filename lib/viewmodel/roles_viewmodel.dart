import 'package:flutter/material.dart';

// true stands for gymuser and false for gym manager
class RolesProvider extends ValueNotifier<bool> {
  RolesProvider(bool isUser) : super(isUser);
}
