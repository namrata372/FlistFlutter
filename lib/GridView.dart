import 'package:flutter/material.dart';
import 'dart:math';

class GridViewEx extends StatefulWidget {
  @override
  _GridViewExState createState() => _GridViewExState();
}

class Area {
  int index;
  String name;
  Color color;
  Area({this.index: -1, this.name: 'Area', this.color: Colors.lightBlueAccent});
}

class _GridViewExState extends State<GridViewEx> {
  int _location = 0;
  List<Area> _areas = <Area>[];

  @override
  void initState() {
    _areas = <Area>[];
    for (int i = 0; i < 16; i++) {
      _areas.add(Area(index: i, name: 'Area ${i}'));
    }

    var rng = Random();
    _location = rng.nextInt(_areas.length);
    print("Location: ${_location}");
  }

  Widget _generate(int index) {
    return GridTile(
        child: Container(
      padding: EdgeInsets.all(5.0),
      child: RaisedButton(
        onPressed: () => _onPressed(index),
        color: _areas[index].color,
        child: Text(_areas[index].name, textAlign: TextAlign.center),
      ),
    ));
  }

  void _onPressed(int index) {
    setState(() {
      if (index == _location) {
        _areas[index].color = Colors.green;
        //You won
      } else {
        _areas[index].color = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Example'),
      ),
      body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
              child: GridView.count(
            crossAxisCount: 4,
            children: List<Widget>.generate(16, _generate),
          ))),
    );
  }
}
