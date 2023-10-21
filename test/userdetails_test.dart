import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nextpass/pages/Detailspage.dart';

void main() {
  group('UserDetailsPage Tests', () {
    testWidgets('Enter valid user details and save', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: UserDetailsPage()));

      // Fill in valid user details
      await tester.enterText(find.text('Name'), 'John Doe');
      await tester.enterText(find.text('Email'), 'john.doe@example.com');
      await tester.enterText(find.text('Visa Number'), 'V123456');
      await tester.enterText(find.text('Contact Number'), '1234567890');
      await tester.tap(find.text('Save User Details'));
      await tester.pump();

      // Expect a success message
      expect(find.text('User details saved successfully'), findsOneWidget);
    });

    testWidgets('Enter missing user details and attempt to save', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: UserDetailsPage()));

      // Don't fill in any user details
      await tester.tap(find.text('Save User Details'));
      await tester.pump();

      // Expect validation error messages for missing details
      expect(find.text('Please enter Name'), findsOneWidget);
      expect(find.text('Please enter Email'), findsOneWidget);
      expect(find.text('Please enter Visa Number'), findsOneWidget);
      expect(find.text('Please enter Contact Number'), findsOneWidget);

      // Expect no success message
      expect(find.text('User details saved successfully'), findsNothing);
    });

    testWidgets('Enter invalid email and attempt to save', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: UserDetailsPage()));

      // Fill in invalid email
      await tester.enterText(find.text('Name'), 'John Doe');
      await tester.enterText(find.text('Email'), 'invalid-email'); // Invalid email
      await tester.enterText(find.text('Visa Number'), 'V123456');
      await tester.enterText(find.text('Contact Number'), '1234567890');
      await tester.tap(find.text('Save User Details'));
      await tester.pump();

      // Expect validation error message for the email format
      expect(find.text('Please enter a valid email'), findsOneWidget);

      // Expect no success message
      expect(find.text('User details saved successfully'), findsNothing);
    });
  });
}