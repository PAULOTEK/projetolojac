import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja/modules/module_login/controllers/auth.controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Entrar'),
              onPressed: () {
                final email = _emailController.text;
                final password = _passwordController.text;

                if (email.isNotEmpty && password.isNotEmpty) {
                  _authController.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                } else {
                  // Show some error message
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
