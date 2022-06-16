import 'package:flutter/material.dart';
import 'package:flutter_tests/pages/home_page.dart';

import 'controllers/counter_controller.dart';

void main() {
  final counterController = CounterController();
  runApp(MyApp(counterController: counterController));
}

class MyApp extends StatelessWidget {
  final CounterController counterController;

  const MyApp({
    Key? key,
    required this.counterController,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        counterController: counterController,
      ),
    );
  }
}