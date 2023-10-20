import 'package:bmicalculator/database/entity/bmi_entity.dart';
import 'package:floor/floor.dart';
import 'dart:async';

@dao
abstract class BmiDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertBmi(BmiEntity entity);

  @Query("""
    SELECT *
    FROM bmi
  """)
  Future<List<BmiEntity>> fetchAllBmiList();

}
