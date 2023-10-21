import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nextpass/pages/PaymentBalance.dart';
import 'package:nextpass/pages/login/AuthService.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  group('AuthService Tests', () {
    AuthService authService = AuthService();

    // success Login - Positive Test Case
    test('Sign in with valid email and password should return a user', () async {
      final email = 'nopw@gmail.com';
      final password = '111111';

      final user = await authService.signIn(email, password);

      // Ensure that a user is returned for valid credentials
      expect(user, isNotNull);
    });

    // Balance Update - Positive Test Case
    testWidgets('Update balance and show success message', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(MaterialApp(
        home: PaymentBalance(),
      ));

      // Tap the "Update Balance" button
      await tester.tap(find.text('Update Balance'));

      // Wait for the update to complete
      await tester.pumpAndSettle();

      // Verify that the success message Snackbar is displayed
      expect(find.text('Payment successful!'), findsOneWidget);
    });

    // failed Login - Negative Test Case
    test('Sign in with invalid email and password should return null', () async {
      final email = 'invalid@example.com';
      final password = 'incorrectpassword';

      final user = await authService.signIn(email, password);

      // Ensure that null is returned for invalid credentials
      expect(user, isNull);
    });

  });
}