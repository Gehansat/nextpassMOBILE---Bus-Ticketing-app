import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nextpass/pages/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      textTheme: const TextTheme(
    // Set the font family for your main text here
        bodyText1: TextStyle(fontFamily: 'Poppins', fontSize: 16),
        bodyText2: TextStyle(fontFamily: 'Poppins', fontSize: 14),
          ),
        ),
      home: const SplashScreen(),
    );
  }
}

