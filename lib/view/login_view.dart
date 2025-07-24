import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsetsGeometry.all(12.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 1. Gambar,
                Image.asset(
                  "lib/assets/images/login.png",
                  height: 300,
                ),
                // 2. Judul,
                SizedBox(height: 12),
                Text(
                  "Notes App",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // 3. Input Username,
                SizedBox(height: 12),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Username",
                    prefixIcon: Icon(Icons.person),
                    border: InputBorder.none,
                    fillColor: Colors.grey.withAlpha(40),
                    filled: true,
                    contentPadding: EdgeInsets.only(top: 13),
                  ),
                ),
                // 4. Input Password,
                SizedBox(height: 12),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.key),
                    suffixIcon: Icon(Icons.visibility),
                    border: InputBorder.none,
                    fillColor: Colors.grey.withAlpha(40),
                    filled: true,
                    contentPadding: EdgeInsets.only(top: 13),
                  ),
                ),
                // 5. Tombol Login,
                SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: () {},
                  label: Text("Login"),
                  icon: Icon(Icons.login),
                ),
                // 6. Teks Buat Akun,
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Create account"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
