import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/controllers/counter_controller.dart';

void main() {
  group('Counter controller', () {
    test('should increment', () {
      // GIVEN
      final counterController = CounterController();

      // WHEN
      counterController.increment();

      // THEN
      expect(counterController.counter, 1);
    });

    test('should decrement', () {
      // GIVEN
      final counterController = CounterController();

      // WHEN
      counterController.decrement();

      // THEN
      expect(counterController.counter, -1);
    });

    test('should reset', () {
      // GIVEN
      final counterController = CounterController();

      // WHEN
      counterController.increment();
      counterController.reset();

      // THEN
      expect(counterController.counter, 0);
    });
  });
}