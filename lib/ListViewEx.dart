import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:core';

class ListViewEx extends StatefulWidget {
  @override
  _ListViewState createState() => _ListViewState();
}

class _ListViewState extends State<ListViewEx> {
  List _pets = ['Dogs', 'Cats', 'Fish', 'Birds', 'Lizards'];
  Map _countries = Map();

  void _getData() async {
    var url = 'http://country.io/names.json';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() => _countries = json.decode(response.body));
      print('Loaded ${_countries.length} countries');
    } else {
      print("Status code: ${response.statusCode}");
    }
  }

  @override
  void initState() {
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Example'),
      ),
      body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text('Available Pets'),
                Expanded(
                    child: ListView.builder(
                        itemCount: _pets.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(_pets.elementAt(index));
                        })),
                Text(
                  'Countries',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: _countries.length,
                  itemBuilder: (BuildContext context, int index) {
                    String key = _countries.keys.elementAt(index);
                    return Row(
                      children: <Widget>[
                        Text('${key} : '),
                        Text(_countries[key])
                      ],
                    );
                  },
                ))
              ],
            ),
          )),
    );
  }
}
