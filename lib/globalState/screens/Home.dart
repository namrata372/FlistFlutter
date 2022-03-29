import 'package:first_flutter/globalState/screens/Third.dart';
import 'package:flutter/material.dart';
import '../code/GlobalState.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _name = TextEditingController();
  GlobalState _store = GlobalState.instance;

  @override
  void initState() {
    _name = TextEditingController();
    _store.set('name', '');
    _name.text = _store.get('name');
  }

  void _onPressed() {
    setState(() {
      _store.set('name', _name.text);
    });
    Navigator.of(context).pushNamed('/Second');
  }

  void _onPressedwithParam() {
    // Navigator.of(context).pushNamed('/Second');
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Third(_name.text),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _name,
                  decoration: InputDecoration(labelText: 'Enter your name'),
                ),
                RaisedButton(
                  onPressed: _onPressed,
                  child: Text('Next'),
                ),
                RaisedButton(
                  onPressed: _onPressedwithParam,
                  child: Text('NextWithParam'),
                )
              ],
            ),
          )),
    );
  }
}
