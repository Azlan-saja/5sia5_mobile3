import 'package:flutter/material.dart';

class LoginController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isVisible = false;

  lihatPassword() {
    isVisible = !isVisible;
  }
}
