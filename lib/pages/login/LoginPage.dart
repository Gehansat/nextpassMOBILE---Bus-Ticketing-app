import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nextpass/pages/login/LoginForm.dart';

import '../Home.dart';
import 'AuthService.dart';

class LoginPage extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Option Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                // Check if the user is already logged in
                User? user = await _authService.getCurrentUser();
                if (user != null) {
                  // User is already logged in, navigate to the Home Page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else {
                  // User is not logged in, navigate to the Login Form
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginForm()),
                  );
                }
              },
              child: const Text("Let's Login!"),
            ),
          ],
        ),
      ),
    );
  }
}

