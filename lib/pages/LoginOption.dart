import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextpass/main.dart';
import 'package:nextpass/pages/Detailspage.dart';
import 'package:nextpass/pages/Home.dart';

class Loginoption extends StatelessWidget {
  const Loginoption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Explore, Connect,\nTravel Together!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
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
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(builder: (ctx) => HomePage()),
                );

              },
              child: const Text('Local Passenger'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff0048FF),
                onPrimary: Colors.white,
                fixedSize: const Size(245, 60),
                textStyle: const TextStyle(
                    fontSize: 20
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(builder: (ctx) => DetailsPage()),
                );
              },
              child: const Text('Foreigner Passenger'),
            ),
          ],
        )
      ),
    );
  }
}