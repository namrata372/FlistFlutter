import 'package:flutter/material.dart';
import './screens/Home.dart';
import './screens/Second.dart';

class NavigationEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      routes: <String, WidgetBuilder>{
        //All available pages
        '/Home': (BuildContext contrext) => Home(),
        '/Second': (BuildContext contrext) => Second(),
      },
      home: Home(), //first page displayed
    );
  }
}
