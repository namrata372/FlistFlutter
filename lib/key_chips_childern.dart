import 'package:flutter/material.dart';

class KeyChips extends StatefulWidget {
  @override
  _KeyChipsState createState() => _KeyChipsState();
}

enum Animals { Cat, Dog, Bird, Lizard, Fish }

class _KeyChipsState extends State<KeyChips> {
  int counter = 0;
  List<Widget> _list = <Widget>[];
  double _value = 0.0;

  void _onChanged(double value) => setState(() => _value = value);
  Animals _selected = Animals.Cat;
  String _value_popup = 'Make a Selection';
  List<PopupMenuEntry<Animals>> _items = <PopupMenuEntry<Animals>>[];

  void _onSelected(Animals animal) {
    setState(() {
      _selected = animal;
      _value_popup = 'You Selected ${_getDisplay(animal)}';
    });
  }

  String _getDisplay(Animals animal) {
    int index = animal.toString().indexOf('.');
    index++;
    return animal.toString().substring(index);
  }

  @override
  void initState() {
    for (Animals animal in Animals.values) {
      _items.add(PopupMenuItem(
        child: Text(
          _getDisplay(animal),
        ),
        value: animal,
      ));
    }
    for (int i = 0; i < 5; i++) {
      Widget child = _Item(i);
      _list.add(child);
    }
  }

  void _onClicked() {
    Widget child = _Item(counter);
    setState(() => _list.add(child));
  }

  Widget _Item(int i) {
    Key key = Key('item_${i}');
    Container child = Container(
      key: key,
      padding: EdgeInsets.all(10.0),
      child: Chip(
        label: Text('${i} Item'),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: 'Delete',
        onDeleted: () => _removeItem(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: Text(i.toString()),
        ),
      ),
    );

    counter++;
    return child;
  }

  void _removeItem(Key key) {
    for (int i = 0; i < _list.length; i++) {
      Widget child = _list.elementAt(i);
      if (child.key == key) {
        setState(() => _list.removeAt(i));
        print('Removing ${key.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Key Chips Childern Example'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClicked,
        child: Icon(Icons.add),
      ),
      body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Column(children: [
              Container(
                padding: EdgeInsets.all(5.0),
                child: Text(_value_popup),
              ),
              PopupMenuButton<Animals>(
                  child: Icon(Icons.input),
                  initialValue: Animals.Cat,
                  onSelected: _onSelected,
                  itemBuilder: (BuildContext context) {
                    return _items;
                  }),
              Slider(value: _value, onChanged: _onChanged),
              Container(
                padding: EdgeInsets.all(32.0),
                child: LinearProgressIndicator(
                  value: _value,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              Container(
                padding: EdgeInsets.all(32.0),
                child: CircularProgressIndicator(
                  value: _value,
                ),
              ),
              Center(
                  child: Column(
                children: _list,
              ))
            ]),
          )),
    );
  }
}
