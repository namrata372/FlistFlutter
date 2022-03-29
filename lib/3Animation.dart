import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimationEx extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AnimationEx> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this);
    animation = Tween(begin: 0.0, end: 200.0).animate(controller);
    animation.addListener(() {
      setState(() {
        //The state of the animation has changed
      });
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Example'),
      ),
      body: Container(
          padding: EdgeInsets.all(32.0),
          height: animation.value,
          width: animation.value,
          child: Center(
              child: FlutterLogo(
            size: 300.0,
          ))),
    );
  }
}
