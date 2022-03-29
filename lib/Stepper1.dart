import 'dart:developer';
import 'package:flutter/material.dart';

class StepperEx extends StatefulWidget {
  @override
  _StepperState createState() => _StepperState();
}

class _StepperState extends State<StepperEx> {
  List<Step> _steps = <Step>[];
  int _current = 0;
  TextEditingController _name = TextEditingController();
  TextEditingController _age = TextEditingController();
  String _nameDisplay = '';
  String _ageDisplay = '';

  @override
  void initState() {
    super.initState();
    _current = 0;
    _name = TextEditingController();
    _age = TextEditingController();
  }

  void _stepContinue() {
    log(_current.toString());
    log(_steps.length.toString());
    setState(() {
      _current++;
      if (_current >= _steps.length) _current + _steps.length - 1;
      if (_current == 2) {
        _ageDisplay = _age.text;
        _nameDisplay = _name.text;
      }
    });
  }

  void _stepCancel() {
    setState(() {
      _current--;
      if (_current < 0) _current = 0;
    });
  }

  void _stepTap(int index) {
    setState(() {
      _current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper'),
      ),
      body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
              child: Stepper(
            type: StepperType.vertical,
            steps: _steps = <Step>[
              Step(
                  title: Text('Step 1'),
                  isActive: true,
                  content: Column(
                    children: <Widget>[
                      TextField(
                        controller: _name,
                        decoration:
                            InputDecoration(labelText: 'Enter your name'),
                      )
                    ],
                  )),
              Step(
                  title: Text('Step 2'),
                  isActive: true,
                  content: Column(
                    children: <Widget>[
                      TextField(
                        controller: _age,
                        decoration:
                            InputDecoration(labelText: 'Enter your age'),
                        keyboardType: TextInputType.number,
                      )
                    ],
                  )),
              Step(
                  title: Text('Step 3'),
                  content: Column(
                    children: <Widget>[
                      Text('You Entered:'),
                      Text('Your name is: ${_nameDisplay}'),
                      Text('Your age is: ${_ageDisplay}'),
                    ],
                  )),
            ],
            currentStep: _current,
            onStepTapped: _stepTap,
            onStepContinue: _stepContinue,
            onStepCancel: _stepCancel,
          ))),
    );
  }
}
