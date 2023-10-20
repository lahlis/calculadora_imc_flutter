import 'dart:async';

import 'package:bmicalculator/bmi_app.dart';
import 'package:bmicalculator/database/app_database.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database =
      await $FloorAppDatabase.databaseBuilder('bmi_database.db').build();

  runApp(
    BMIApp(bmiDao: database.bmiDao),
  );
}
