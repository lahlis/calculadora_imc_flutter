import 'dart:async';

import 'package:bmicalculator/database/dao/bmi_dao.dart';
import 'package:bmicalculator/database/entity/bmi_entity.dart';

import '../model/bmi_model.dart';

class BMIRepository {
  BMIRepository({
    required this.bmiDao,
  });

  final BmiDao bmiDao;

  FutureOr<void> add(BMI bmi) async {
    final BmiEntity entity = BmiEntity(
      name: bmi.name,
      height: bmi.height,
      weight: bmi.weight,
    );

    await bmiDao.insertBmi(entity);
  }

  Future<List<BMI>> getList() async {
    final List<BmiEntity> bmiEntityList = await bmiDao.fetchAllBmiList();

    final List<BMI> result = bmiEntityList
        .map(
          (e) => BMI(
            e.name ?? "",
            e.weight ?? 0.0,
            e.height ?? 0.0,
          ),
        )
        .toList();

    return result;
  }
}
