import 'package:flutter/material.dart';
import 'semester_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk input
  final TextEditingController _usernameController =
  TextEditingController();
  final TextEditingController _passwordController =
  TextEditingController();

  // Kredensial dummy (tanpa database)
  final String _validUsername = "admin";
  final String _validPassword = "12345";

  String _errorMessage = "";

  void _login(BuildContext context) {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username == _validUsername &&
        password == _validPassword) {
      // Login berhasil
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const SemesterPage(),
        ),
      );
    } else {
      // Login gagal
      setState(() {
        _errorMessage = "Username atau password salah";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
              ),

            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => _login(context),
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
