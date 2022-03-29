import 'package:flutter/material.dart';

class Third extends StatefulWidget {
  Third(this.name);
  String name;
  @override
  _ThirdState createState() => _ThirdState(name);
}

class _ThirdState extends State<Third> {
  _ThirdState(this.name);
  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third'),
      ),
      body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text('Hello ${name}'),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Back'),
                )
              ],
            ),
          )),
    );
  }
}
