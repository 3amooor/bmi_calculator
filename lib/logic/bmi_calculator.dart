class BMICalculator {
  final double height;
  final int weight;

  late final double _bmi;

  BMICalculator({required this.height, required this.weight}) {
    _bmi = weight / ((height / 100) * (height / 100));
  }

  String getBMI() => _bmi.toStringAsFixed(1);

  String getResult() {
    if (_bmi >= 25) return 'Overweight';
    if (_bmi > 18.5) return 'Normal';
    return 'Underweight';
  }

  String getInterpretation() {
    if (_bmi >= 25) return 'You have a higher than normal body weight. Try to exercise more.';
    if (_bmi > 18.5) return 'You have a normal body weight. Good job!';
    return 'You have a lower than normal body weight. Eat more!';
  }
}
