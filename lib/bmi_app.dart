import 'package:bmicalculator/database/dao/bmi_dao.dart';
import 'package:bmicalculator/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class BMIApp extends StatelessWidget {
  const BMIApp({
    super.key,
    required this.bmiDao,
  });

  final BmiDao bmiDao;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        //fontFamily: "Fredoka",
      ),
      home: WelcomePage(bmiDao: bmiDao),
      title: "BMI Calculator",
    );
  }
}
