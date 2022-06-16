import 'package:flutter/material.dart';
import 'package:flutter_tests/controllers/counter_controller.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({
    Key? key,
    required this.title,
    required this.counterController,
  }) : super(key: key);

  final String title;

  final _pageController = PageController();

  final CounterController counterController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: counterController,
      builder: (context, _) {
        return Scaffold(
          drawer: Drawer(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => _showAbout(context),
                    child: SizedBox(
                      height: 48,
                      child: Center(
                        child: Text(
                          'About',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          appBar: AppBar(
            title: Text(title),
          ),
          body: PageView(
            controller: _pageController,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${counterController.counter}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
              Center(
                child: FloatingActionButton.extended(
                  onPressed: () => counterController.reset(),
                  icon: const Icon(
                    Icons.refresh,
                  ),
                  label: const Text("Reset"),
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () => counterController.increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: IconButton(
                    icon: Icon(
                      Icons.calculate,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onPressed: () => _navigateToPage(0),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: const Icon(Icons.flutter_dash),
                    onPressed: () => _navigateToPage(1),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _navigateToPage(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(
        milliseconds: 400,
      ),
      curve: Curves.easeInOut,
    );
  }

  void _showAbout(BuildContext context) {
    Navigator.of(context).pop();
    showAboutDialog(
      context: context,
      applicationName: 'Flutter Demo',
      applicationVersion: '1.0.0',
      applicationIcon: const FlutterLogo(),
      applicationLegalese: 'MIT License',
      children: [
        const Text('This is a Flutter demo.'),
        const Text('(c) 2020 The Flutter Authors'),
      ],
    );
  }
}