import 'package:flutter/material.dart';
import 'package:nextpass/pages/LoginOption.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Next Pass',
      theme: ThemeData(

      ),
      home: const Loginoption(),
    );
  }
}

