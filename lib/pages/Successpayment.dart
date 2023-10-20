import 'package:flutter/material.dart';
import 'package:nextpass/pages/QrUI.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SuccessfulPaymentScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SuccessfulPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Successful Payment"),
        backgroundColor: const Color(0xff0048FF), // Customize the app bar color
      ),
      body: Container(
        color: Colors.white, // Customize the background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_circle,
                color: const Color(0xff0048FF),
                size: 100.0,
              ),
              SizedBox(height: 20.0),
              Text(
                "Payment Successful",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Thank you for your payment!",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
  // Add action to navigate to another screen or close this message
   Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => QRScreen()));
},
                child: Text("Continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
