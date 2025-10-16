import 'package:aplikasi_5sia5_mobile3/views/login_view.dart';
import 'package:aplikasi_5sia5_mobile3/views/note/note_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: LoginView(),
      // home: NoteView(),
    );
  }
}
