import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Home.dart';
import 'AuthService.dart';

class LoginForm extends StatelessWidget {
  final AuthService _authService = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Form')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 50),
              Image.asset("assets/logo.png",
                scale: 1.3,
              ),
              const SizedBox(height: 60),
              const Text("Sign in your account",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff0048FF),
                  onPrimary: Colors.white,
                  fixedSize: const Size(245, 60),
                  textStyle: const TextStyle(
                      fontSize: 20
                  ),
                ),
                onPressed: () async {
                  // Perform login using email and password
                  String email = emailController.text;
                  String password = passwordController.text;
                  User? user = await _authService.signIn(email, password);

                  if (user != null) {
                    // Login success, navigate to Home Page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } else {
                    // Login failed, show an error message
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Login Error'),
                          content: Text('Invalid email or password.'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}