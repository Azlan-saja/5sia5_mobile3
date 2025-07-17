import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(12.5),
          child: Column(
            children: [
              // 1. Gambar,
              // 2. Judul,
              // 3. Input Username,
              // 4. Input Password,
              // 5. Tombol Login,
              // 6. Teks Buat Akun,
            ],
          ),
        ),
      ),
    );
  }
}
