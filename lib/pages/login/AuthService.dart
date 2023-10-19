import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Singleton class for managing user authentication
class AuthService {
  static final AuthService _instance = AuthService._internal();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<User?> signIn(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      return null; // Login failed
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}