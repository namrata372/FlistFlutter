import 'package:flutter/material.dart';

class UseofExpanded extends StatefulWidget {
  @override
  _UseofExpandedState createState() => _UseofExpandedState();
}

class _UseofExpandedState extends State<UseofExpanded> {
  TextEditingController _user = TextEditingController();
  TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Use of Expanded and CardView'),
      ),
      body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text('Please Login'),
                Row(
                  children: <Widget>[
                    Text('Username: '),
                    Expanded(
                        child: TextField(
                      controller: _user,
                    ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Password: '),
                    Expanded(
                        child: TextField(
                      controller: _pass,
                      obscureText: true,
                    ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(32.0),
                  child: RaisedButton(
                    onPressed: () => print('Login ${_user.text}'),
                    child: Text('Click me'),
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(32.0),
                    child: Column(
                      children: <Widget>[
                        Text('Hello World!'),
                        Text('How are you?')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
