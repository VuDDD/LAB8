// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String bmi;
  final String status;
  final String advice;

  const ResultScreen({
    super.key,
    required this.bmi,
    required this.status,
    required this.advice,
  });

  static const Color _accentColor = Color(0xFFEB1555);
  static const Color _cardColor = Color(0xFF1D1E33);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Result')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: _cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Result',
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 28),
                    Text(
                      status.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF24D876),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      bmi,
                      style: const TextStyle(
                        fontSize: 88,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Your BMI',
                      style: TextStyle(
                        color: Color(0xFF8D8E98),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Normal BMI range:\n18.5 - 24.9 kg/m²',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      advice,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Semantics(
            button: true,
            label: 'Recalculate BMI',
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 80,
                color: _accentColor,
                alignment: Alignment.center,
                child: const Text(
                  'RE-CALCULATE',
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
