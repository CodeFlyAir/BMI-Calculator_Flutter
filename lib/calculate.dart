import 'dart:math';

class calculate {
  calculate({required this.weight, required this.height});

  final double weight;
  final double height;
  double _bmi = 0.0;

  String computeBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBmiResult() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getDescription() {
    if (_bmi >= 25) {
      return 'You have higher than normal body weight. Try to exercise more';
    } else if (_bmi > 18.5) {
      return 'You have a perfectly normal body weight. Good Job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more :P';
    }
  }
}
