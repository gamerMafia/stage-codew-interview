import 'package:flutter/material.dart';
import 'package:flutter_demo/main.dart';

import 'api_data_page.dart';

class SecondRoute extends StatefulWidget {
  SecondRoute({Key? key, this.data}) : super(key: key);
  final String? data;

  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Second ${widget.data}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                context,
                  MaterialPageRoute(builder: (context) => const FirstRoute()),
                        (Route<dynamic> route) => false
                );
              },
              child: Text('${widget.data}'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const
                  ApiDataPage(data:'Api Data Page')),
                );
              },
              child: const Text('Open ->  Api Data Page'),
            ),
          ],
        ),
      ),
    );
  }
}
