import 'package:bmicalculator/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class BMIApp extends StatelessWidget {
  const BMIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        //fontFamily: "Fredoka",
      ),
      home: const WelcomePage(),
      title: "BMI Calculator",
    );
  }
}
