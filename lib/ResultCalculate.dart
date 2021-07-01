import 'dart:math';

class Calculator {
  final int? height;
  final int? weight;
  late double result;

  Calculator({this.height, this.weight});

  String calculateBMI() {
    result = weight! / pow(height! / 100, 2);
    return result.toStringAsFixed(1);
  }

  String getResult() {
    if (result >= 25) {
      return 'overweight';
    } else if (result >= 18.5) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }

  String getInterpretations() {
    if (result >= 25) {
      return 'You have a higher weight than normal';
    } else if (result >= 18.5) {
      return 'You have a normal body weight, Good job';
    } else {
      return 'You have a lower than normal body weight, you can eat more';
    }
  }
}
