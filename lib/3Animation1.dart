import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimationEx1 extends StatefulWidget {
  @override
  _State createState() =>  _State();
}

class MyButton extends AnimatedWidget {
  bool large = false;

  static final _sizeTween =  Tween<double>(begin: 1.0, end: 2.0);
  late AnimationController controller;
  MyButton(
      {required Key key,
      required Animation<double> animation,
      required AnimationController controller})
      : super(key: key, listenable: animation) {
    this.controller = controller;
  }

  void onPressed() {
    if (!large) {
      controller.forward();
      large = true;
    } else {
      controller.reverse();
      large = false;
    }
  }

  Widget build(BuildContext context) {
    final Animation<double> animation/*= listenable*/;
    return  RaisedButton(
      onPressed: onPressed,
      child:  Text('Click me'),
    );
  }
}

class _State extends State<AnimationEx1> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldstate =
       GlobalKey<ScaffoldState>();
  late Animation<double> animation;
  late AnimationController controller;

  initState() {
    super.initState();
    controller =  AnimationController(
        duration: const Duration(milliseconds: 10000), vsync: this);
    animation =  CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  Text('Name here'),
      ),
      body:  Container(
        padding:  EdgeInsets.all(32.0),
        child:  Center(
          child:  Column(
            children: <Widget>[
               Text('Widgets here'),
               MyButton(
                animation: animation,
                controller: controller,
                key: _scaffoldstate,
              )
            ],
          ),
        ),
      ),
    );
  }
}
