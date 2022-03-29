import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class CourseMain extends StatefulWidget {
  @override
  _CourseMainState createState() => _CourseMainState();
}

enum Answers { YES, NO, MAYBE }

class _CourseMainState extends State<CourseMain> {
  String _value = "Hello World!!!";
  int num = 0;
  bool chk_value1 = false;
  bool chk_value2 = false;
  int rd_value1 = 0;
  int rd_value2 = 0;
  void onChanged_chk1(bool? value) => setState(() => chk_value1 = value!);

  void onChanged_chk2(bool? value) => setState(() => chk_value2 = value!);

  void onChanged_rd1(int? value) => setState(() => rd_value1 = value!);
  void onChanged_rd2(int? value) => setState(() => rd_value2 = value!);

  void onPressed(String value) {
    setState(() {
      _value = value;
    });
  }

  void onSubmit(String value) {
    setState(() => _value = 'Submit: ${value}');
  }

  void onPress() {
    setState(() {
      _value = DateTime.now().toString();
    });
  }

  void add() {
    setState(() {
      num++;
    });
  }

  void subtract() {
    setState(() {
      num--;
    });
  }

  Widget makeRadios() {
    List<Widget> list = <Widget>[];

    for (int i = 0; i < 3; i++) {
      list.add(
          Radio(value: i, groupValue: rd_value1, onChanged: onChanged_rd1));
    }
    Column column = Column(
      children: list,
    );
    return column;
  }

  Widget makeRadioTiles() {
    List<Widget> list = <Widget>[];

    for (int i = 0; i < 3; i++) {
      list.add(RadioListTile(
        value: i,
        groupValue: rd_value2,
        onChanged: onChanged_rd2,
        activeColor: Colors.green,
        controlAffinity: ListTileControlAffinity.trailing,
        title: Text('Item: ${i}'),
        subtitle: Text('sub title'),
      ));
    }

    Column column = Column(
      children: list,
    );
    return column;
  }

  double _slidervalue = 0.0;
  void _setSlidervalue(double value) => setState(() => _slidervalue = value);

  String _date_value = '';
  List<BottomNavigationBarItem> _items = <BottomNavigationBarItem>[];
  int _index = 0;
  String bottom_value = "";
  final GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();
  void _showbar() {
    _scaffoldstate.currentState
        ?.showSnackBar(SnackBar(content: Text('Hello world')));
  }

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2016),
        lastDate: DateTime(2099));
    if (picked != null) setState(() => _date_value = picked.toString());
  }

  void _showBottom() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Some info here',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                RaisedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Close'),
                )
              ],
            ),
          );
        });
  }

  void _showAlert(BuildContext context, String message) async {
    AlertDialog alert = AlertDialog(
      title: Text(message),
      actions: [
        FlatButton(onPressed: () => Navigator.pop(context), child: Text('Ok'))
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message),
            actions: [
              FlatButton(
                  onPressed: () => Navigator.pop(context), child: Text('Ok'))
            ],
          );
        });
  }

  Future _askUser() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Do you like Flutter?'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('Yes!!!'),
                onPressed: () {
                  Navigator.pop(context, Answers.YES);
                },
              ),
              SimpleDialogOption(
                child: Text('NO :('),
                onPressed: () {
                  Navigator.pop(context, Answers.NO);
                },
              ),
              SimpleDialogOption(
                child: Text('Maybe :|'),
                onPressed: () {
                  Navigator.pop(context, Answers.MAYBE);
                },
              ),
            ],
          );
        })) {
      case Answers.YES:
        onPressed('Yes');
        break;
      case Answers.NO:
        onPressed('No');
        break;
      case Answers.MAYBE:
        onPressed('Maybe');
        break;
    }
  }

  @override
  void initState() {
    // _items =  List<BottomNavigationBarItem>.empty();
    // _items.add( BottomNavigationBarItem(icon:  Icon(Icons.people), title:  Text('People')));
    // _items.add( BottomNavigationBarItem(icon:  Icon(Icons.weekend), title:  Text('Weekend')));
    //s _items.add( BottomNavigationBarItem(icon:  Icon(Icons.message), title:  Text('Message')));
    //_items.add( BottomNavigationBarItem(icon:  Icon(Icons.people), title:  Text('People')));
    //_items.add( BottomNavigationBarItem(icon:  Icon(Icons.weekend), title:  Text('Weekend')));
    //_items.add( BottomNavigationBarItem(icon:  Icon(Icons.message), title:  Text('Message')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldstate,
      appBar: AppBar(
        title: Text('Flutter Basic'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(onPressed: add, icon: Icon(Icons.add)),
          IconButton(onPressed: subtract, icon: Icon(Icons.remove)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPress,
        mini: true,
        backgroundColor: Colors.red,
        child: Icon(Icons.timer),
      ),
      /*bottomNavigationBar:  BottomNavigationBar(
        items: _items,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
        currentIndex: _index,
        onTap: (int item) {
          setState((){
            _index = item;
            _value = "Current value is: ${_index.toString()}";
          });
        },

      ),*/
      persistentFooterButtons: [
        IconButton(
            onPressed: () => onPressed("Button 1"), icon: Icon(Icons.image)),
        IconButton(
            onPressed: () => onPressed("Button 2"), icon: Icon(Icons.archive)),
        IconButton(
            onPressed: () => onPressed("Button 3"), icon: Icon(Icons.people)),
      ],
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              Text("Hello Drawer"),
              RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Close"),
              )
            ],
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(_value),
                  RaisedButton(
                    onPressed: () => onPressed("My Name is Namrata"),
                    child: Text("Click Me"),
                  ),
                  FlatButton(onPressed: onPress, child: Text("Click Me")),
                  Text(
                    "Value is: ${num}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                  IconButton(
                    onPressed: add,
                    icon: Icon(Icons.add),
                    tooltip: "will add one",
                  ),
                  IconButton(
                    onPressed: subtract,
                    icon: Icon(Icons.remove),
                    tooltip: "will decrease one",
                  ),
                  TextField(
                    decoration: InputDecoration(
                        helperText: "Helper",
                        labelText: "Label",
                        hintText: "Hint",
                        icon: Icon(Icons.account_box)),
                    autocorrect: true,
                    //autofocus: true,
                    keyboardType: TextInputType.name,
                    onChanged: onPressed,
                    onSubmitted: onSubmit,
                  ),
                  Checkbox(value: chk_value1, onChanged: onChanged_chk1),
                  CheckboxListTile(
                    value: chk_value2,
                    onChanged: onChanged_chk2,
                    title: Text("Title"),
                    controlAffinity: ListTileControlAffinity.leading,
                    subtitle: Text("Subtitle"),
                    secondary: Icon(Icons.archive),
                    activeColor: Colors.red,
                  ),
                  makeRadios(),
                  makeRadioTiles(),
                  Switch(value: chk_value1, onChanged: onChanged_chk1),
                  SwitchListTile(
                    value: chk_value2,
                    onChanged: onChanged_chk2,
                    title: Text(
                      'Hello World',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ),
                  Text('Value: ${(_slidervalue * 100).round()}'),
                  Slider(value: _slidervalue, onChanged: _setSlidervalue),
                  Text(_date_value),
                  RaisedButton(
                    onPressed: _selectDate,
                    child: Text('Click me'),
                  ),
                  RaisedButton(
                    onPressed: _showBottom,
                    child: Text('Show bottom sheet'),
                  ),
                  RaisedButton(
                    onPressed: _showbar,
                    child: Text('Show snake bar'),
                  ),
                  RaisedButton(
                    onPressed: () =>
                        _showAlert(context, 'Do you like flutter, I do!'),
                    child: Text('Show Alert'),
                  ),
                  RaisedButton(
                    onPressed: _askUser,
                    child: Text('Simple Dialogue Button'),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
