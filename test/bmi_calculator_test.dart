import 'package:bmi_calculator/bmiCalculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('calculates BMI from centimetres and kilograms', () {
    final calculator = BmiCalculator(height: 170, weight: 60);

    expect(calculator.calculate(), '20.8');
    expect(calculator.getCategory(), 'Normal');
  });

  test('classifies BMI below and above the normal range', () {
    final underweight = BmiCalculator(height: 180, weight: 55);
    final overweight = BmiCalculator(height: 170, weight: 80);

    underweight.calculate();
    overweight.calculate();

    expect(underweight.getCategory(), 'Underweight');
    expect(overweight.getCategory(), 'Overweight');
  });

  test('rejects non-positive height or weight', () {
    expect(
      () => BmiCalculator(height: 0, weight: 60).calculate(),
      throwsArgumentError,
    );
    expect(
      () => BmiCalculator(height: 170, weight: 0).calculate(),
      throwsArgumentError,
    );
  });
}
