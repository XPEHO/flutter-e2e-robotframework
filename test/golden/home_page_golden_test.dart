import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/controllers/counter_controller.dart';
import 'package:flutter_tests/pages/home_page.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testWidgets('Home page golden test', (widgetTester) async {
    // Load fonts
    await loadAppFonts();
    final controller = CounterController();
    await widgetTester.pumpWidget(
      MaterialApp(
        home: MyHomePage(
          title: 'Golden title',
          counterController: controller,
        ),
      ),
    );
    await expectLater(find.byType(MyHomePage),
        matchesGoldenFile('home_page_golden_test.png'));
  });
}
