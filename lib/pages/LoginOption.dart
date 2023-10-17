import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loginoption extends StatelessWidget {
  const Loginoption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Explore, Connect,\nTravel Together!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff0048FF),
                onPrimary: Colors.white,
                fixedSize: Size(245, 60),
                textStyle: const TextStyle(
                  fontSize: 20
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(builder: (ctx) => Loginoption()),
                );

              },
              child: Text('Local Passenger'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff0048FF),
                onPrimary: Colors.white,
                fixedSize: Size(245, 60),
                textStyle: const TextStyle(
                    fontSize: 20
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(builder: (ctx) => Loginoption()),
                );
              },
              child: Text('Foreginer Passenger'),
            ),
          ],
        )
      ),
    );
  }
}