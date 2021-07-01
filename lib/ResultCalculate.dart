import 'dart:math';

import 'package:bmi_calculator/view/InputPage.dart';

class Calculator {
  final int? height;
  final int? weight;
  late double result;
  final Gender? selectGender;

  Calculator({this.height, this.weight, this.selectGender});

  String calculateBMI() {
    result = weight! / pow(height! / 100, 2);
    return result.toStringAsFixed(1);
  }

  String getResult() {
    if (result >= 25) return 'overweight';

    if (result >= 18.5) return 'normal';

    return 'underweight';
  }

  String getInterpretations() {
    if (result >= 25)
      return '${genderText()}\nYou have a higher weight than normal';

    if (result >= 18.5)
      return '${genderText()}\nYou have a normal body weight, Good job';

    return '${genderText()}\nYou have a lower than normal body weight, you can eat more';
  }

  String genderText() {
    if (selectGender == Gender.male) return "Hey Man...";
    return "Hey Lady...";
  }
}
