import 'package:flutter/material.dart';
import 'package:flutter_demo/page/second_route.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Goto Screen 1'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute(data:"Screen 1 x")),
                        (Route<dynamic> route) => false
                );
              },
            ),
            ElevatedButton(
              child: const Text('Goto Screen 2'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute(data:"Screen 2 y")),
                        (Route<dynamic> route) => false
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
