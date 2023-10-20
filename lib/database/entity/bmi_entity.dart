import 'package:floor/floor.dart';

@Entity(tableName: "bmi")
class BmiEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String? name;
  final double? height;
  final double? weight;

  BmiEntity({
    this.id,
    this.name,
    this.height,
    this.weight,
  });
}
