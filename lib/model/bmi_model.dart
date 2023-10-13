class BMI {
  String _name;
  double _weight;
  double _height;

  BMI(this._name, this._weight, this._height);

  String get name => _name;
  double get weight => _weight;
  double get height => _height;

  double _calculate() {
    var bmi = _weight / (_height * _height);
    return bmi.truncateToDouble();
  }

  String bmiTable() {
    final bmi = _calculate();

    var result = "$bmi - ";

    if (bmi < 16) {
      return result += "Magreza grave";
    }
    if (bmi < 17) {
       return result += "Magreza moderada";
    }
    if (bmi < 18.5) {
       return result += "Magreza leve";
    }
    if (bmi < 25) {
       return result += "Saudável";
    }
    if (bmi < 30) {
       return result += "Sobrepeso";
    }
    if (bmi < 35) {
       return result += "Obesidade Grau I";
    }
    if (bmi < 40) {
       return result += "Obesidade Grau II";
    }
    if (bmi >= 40) {
       return result += "Obesidade Grau III";
    }

    return "";
  }
}
