import 'package:flutter/material.dart';
import 'dart:async';
import 'TimeDisplay.dart';

class TimeCounter extends StatefulWidget {
  @override
  _TimeCounterState createState() =>  _TimeCounterState();
}

class _TimeCounterState extends State<TimeCounter> {
  Stopwatch _watch =  Stopwatch();
  Duration _duration =  Duration();
  late Timer _timer;

  void _onStart() {
    setState(() {
      _watch =  Stopwatch();
      _timer =  Timer.periodic( Duration(milliseconds: 250), _onTimeOut);
    });
    _watch.start();
  }

  void _onStop() {
    _timer.cancel();
    _watch.stop();
  }

  void _onTimeOut(Timer timer) {
    if (!_watch.isRunning) return;
    setState(() => _duration = _watch.elapsed);
  }

  void _onClear(Duration value) {
    setState(() => _duration =  Duration());
  }

  @override
  void initState() {
    _duration =  Duration();
  }

  final GlobalKey<ScaffoldState> key =  GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:  EdgeInsets.all(10.0),
      child:  Center(
        child:  Column(
          children: <Widget>[
             TimeDisplay(
              color: Colors.red,
              duration: _duration,
              onClear: _onClear,
              key: key,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 Padding(
                  padding:  EdgeInsets.all(10.0),
                  child:  RaisedButton(
                    onPressed: _onStart,
                    child:  Text('Start'),
                  ),
                ),
                 Padding(
                  padding:  EdgeInsets.all(10.0),
                  child:  RaisedButton(
                    onPressed: _onStop,
                    child:  Text('Stop'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
