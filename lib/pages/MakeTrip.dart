import 'package:flutter/material.dart';

class MakeTrip extends StatelessWidget {
  const MakeTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text("Start Your Journey!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
