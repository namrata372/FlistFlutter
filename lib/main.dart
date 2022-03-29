import 'package:first_flutter/Dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// #docregion MyApp
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // #docregion build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
// #enddocregion build
}
