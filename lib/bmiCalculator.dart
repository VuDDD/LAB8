// ignore_for_file: file_names

class BmiCalculator {
  final int height;
  final int weight;

  BmiCalculator({required this.height, required this.weight});

  double _bmiValue = 0;

  String calculate() {
    if (height <= 0 || weight <= 0) {
      throw ArgumentError('Height and weight must be greater than zero.');
    }

    final heightInMeters = height / 100;
    _bmiValue = weight / (heightInMeters * heightInMeters);
    return _bmiValue.toStringAsFixed(1);
  }

  String getCategory() {
    if (_bmiValue >= 25) return 'Overweight';
    if (_bmiValue >= 18.5) return 'Normal';
    return 'Underweight';
  }

  String getAdvice() {
    if (_bmiValue >= 25) {
      return 'Your BMI is above the normal range. Regular activity and '
          'balanced meals can support your health.';
    } else if (_bmiValue >= 18.5) {
      return 'Your BMI is within the normal range. Keep up your healthy habits!';
    } else {
      return 'Your BMI is below the normal range. Consider discussing '
          'healthy ways to reach your goals with a health professional.';
    }
  }
}
