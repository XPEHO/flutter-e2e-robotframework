
import 'package:flutter/foundation.dart';

class CounterController with ChangeNotifier {
  int _counter = 0;

  CounterController();

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }
}