import 'package:flutter/material.dart';
import 'nameeditor.dart';

class ChildtoParentEx extends StatefulWidget {
  @override
  _ChildtoParentState createState() => _ChildtoParentState();
}

class _ChildtoParentState extends State<ChildtoParentEx> {
  String _name = '';

  @override
  void initState() {
    _name = '';
  }

  void onNameChanged(String value) {
    setState(() => _name = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Child to Parent Example'),
      ),
      body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text('Hello ${_name}'),
                NameEditor(onNameChanged),
              ],
            ),
          )),
    );
  }
}
