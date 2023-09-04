import 'package:flutter/material.dart';
import 'package:hello/final.dart';

void main() {
  runApp(screenhome());
}

class screenhome extends StatelessWidget {
  const screenhome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}
