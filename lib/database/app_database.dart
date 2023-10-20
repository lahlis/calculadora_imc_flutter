import 'dart:async';

import 'package:bmicalculator/database/dao/bmi_dao.dart';
import 'package:bmicalculator/database/entity/bmi_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(
  version: 1,
  entities: [
    BmiEntity,
  ],
)
abstract class AppDatabase extends FloorDatabase {
  BmiDao get bmiDao;
}
