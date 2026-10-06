import 'package:bmi_calculator/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('calculates BMI and returns to the input screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const BmiApp());

    expect(find.text('BMI CALCULATOR'), findsOneWidget);
    expect(find.text('170 cm', findRichText: true), findsOneWidget);
    expect(find.text('60'), findsOneWidget);
    expect(find.text('25'), findsOneWidget);

    await tester.tap(find.text('CALCULATE'));
    await tester.pumpAndSettle();

    expect(find.text('Your Result'), findsOneWidget);
    expect(find.text('20.8'), findsOneWidget);
    expect(find.text('NORMAL'), findsOneWidget);

    await tester.tap(find.text('RE-CALCULATE'));
    await tester.pumpAndSettle();

    expect(find.text('BMI CALCULATOR'), findsOneWidget);
    expect(find.text('170 cm', findRichText: true), findsOneWidget);
  });

  testWidgets('age controls update the displayed age', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const BmiApp());

    await tester.tap(find.byTooltip('Increase Age'));
    await tester.pump();
    expect(find.text('26'), findsOneWidget);

    await tester.tap(find.byTooltip('Decrease Age'));
    await tester.pump();
    expect(find.text('25'), findsOneWidget);
  });
}
