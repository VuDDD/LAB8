// ignore_for_file: file_names

import 'package:bmi_calculator/bmiCalculator.dart';
import 'package:bmi_calculator/resultScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const Color _cardColor = Color(0xFF1D1E33);
  static const Color _accentColor = Color(0xFFEB1555);

  int height = 170;
  int weight = 60;
  int age = 25;

  void _calculateBmi() {
    final calculator = BmiCalculator(height: height, weight: weight);

    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder:
            (_) => ResultScreen(
              bmi: calculator.calculate(),
              status: calculator.getCategory(),
              advice: calculator.getAdvice(),
            ),
      ),
    );
  }

  Widget _buildMetricCard({
    required String label,
    required String unit,
    required int value,
    required VoidCallback onDecrease,
    required VoidCallback onIncrease,
    required bool canDecrease,
    required bool canIncrease,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: _cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(color: Color(0xFF8D8E98), fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '$value',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(unit, style: const TextStyle(color: Color(0xFF8D8E98))),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  tooltip: 'Decrease $label',
                  onPressed: canDecrease ? onDecrease : null,
                  icon: const Icon(Icons.remove_circle, size: 38),
                  color: Colors.white,
                  disabledColor: const Color(0xFF555660),
                ),
                const SizedBox(width: 8),
                IconButton(
                  tooltip: 'Increase $label',
                  onPressed: canIncrease ? onIncrease : null,
                  icon: const Icon(Icons.add_circle, size: 38),
                  color: Colors.white,
                  disabledColor: const Color(0xFF555660),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI CALCULATOR')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 18, 20, 12),
                    decoration: BoxDecoration(
                      color: _cardColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Height',
                          style: TextStyle(
                            color: Color(0xFF8D8E98),
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text.rich(
                          TextSpan(
                            text: '$height',
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                            children: const [
                              TextSpan(
                                text: ' cm',
                                style: TextStyle(
                                  color: Color(0xFF8D8E98),
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 100,
                          max: 220,
                          divisions: 120,
                          label: '$height cm',
                          onChanged: (value) {
                            setState(() {
                              height = value.round();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildMetricCard(
                        label: 'Weight',
                        unit: 'kg',
                        value: weight,
                        canDecrease: weight > 1,
                        canIncrease: weight < 300,
                        onDecrease: () => setState(() => weight--),
                        onIncrease: () => setState(() => weight++),
                      ),
                      const SizedBox(width: 16),
                      _buildMetricCard(
                        label: 'Age',
                        unit: 'years',
                        value: age,
                        canDecrease: age > 1,
                        canIncrease: age < 120,
                        onDecrease: () => setState(() => age--),
                        onIncrease: () => setState(() => age++),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Semantics(
            button: true,
            label: 'Calculate BMI',
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _calculateBmi,
              child: Container(
                height: 80,
                color: _accentColor,
                alignment: Alignment.center,
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
