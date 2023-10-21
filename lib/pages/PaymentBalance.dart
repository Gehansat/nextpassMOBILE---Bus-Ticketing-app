import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PaymentBalance extends StatefulWidget {
  @override
  _PaymentBalanceState createState() => _PaymentBalanceState();
}

class _PaymentBalanceState extends State<PaymentBalance> {
  final TextEditingController balanceController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Balance'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 60),
            const Text(
              "Payment Page",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextField(
              // controller: cardNumberController,
              decoration: InputDecoration(labelText: 'Your Card Number'),
              keyboardType: TextInputType.number,
            ),
            const TextField(
              // controller: cardNumberController,
              decoration: InputDecoration(labelText: 'Exp. Date'),
              keyboardType: TextInputType.number,
            ),
            const TextField(
              // controller: cardNumberController,
              decoration: InputDecoration(labelText: 'CVV'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: balanceController,
              decoration: InputDecoration(labelText: 'Amount You Want to Add'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateBalance(balanceController.text, context);
              },
              child: Text('Update Balance'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updateBalance(String newBalance, BuildContext context) async {
    final user = _auth.currentUser;
    if (user != null) {
      final userData = {'balance': newBalance};

      // Update the Firestore document with the new balance
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(userData, SetOptions(merge: true));

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Payment successful!'),
      ));

      // Navigate back to the previous page after updating the balance
      Navigator.of(context).pop();
    }
  }
}
