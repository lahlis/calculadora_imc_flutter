import '../model/bmi_model.dart';

class BMIRepository{
  final List<BMI> _bmiList = [];

  void add(BMI bmi){
    _bmiList.add(bmi);
  }

  BMI getBMIByIndex(int index) => _bmiList[index];

  List<BMI> getList() => _bmiList;

  int get count => _bmiList.length;
}