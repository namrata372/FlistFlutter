import 'package:flutter/material.dart';
import 'dart:math';

class Area {
  int index;
  String name;
  Color color;
  Area({this.index: -1, this.name: 'Area', this.color: Colors.lightBlueAccent});
}

class Stepper2Ex extends StatefulWidget {
  @override
  _Stepper2State createState() => _Stepper2State();
}

class _Stepper2State extends State<Stepper2Ex> {
  List<Step> _steps = [];
  int _current = 0;

  @override
  void initState() {
    _current = 0;
    _steps = <Step>[
      Step(
          title: Text('Step 1'), content: Text('Do Something'), isActive: true),
      Step(
          title: Text('Step 2'),
          content: Text('Do Something'),
          isActive: false),
      Step(
          title: Text('Step 3'),
          content: Text('Do Something'),
          isActive: false),
    ];
  }

  void _stepContinue() {
    setState(() {
      _current++;
      if (_current >= _steps.length) _current = _steps.length - 1;
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
        title: Text('Stepper Example'),
      ),
      body: Center(
          child: Stepper(
        steps: _steps,
        type: StepperType.vertical,
        currentStep: _current,
        onStepCancel: _stepCancel,
        onStepContinue: _stepContinue,
        onStepTapped: _stepTap,
      )),
    );
  }
}
