import 'package:flutter/material.dart';

class PaintEx extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //All our work will be done

    final radius = 100.0;
    final Offset offset = Offset(0.0, 75.0);
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 10.0
      ..color = Colors.blue
      ..style = PaintingStyle.stroke;

    final Offset bodystart = Offset(0.0, 50.0);
    final Offset bodyend = Offset(0.0, 0.0);

    canvas.drawCircle(offset, radius, paint);
    canvas.drawLine(bodystart, bodyend, paint);

    final Rect rect = Rect.fromCircle(center: offset, radius: radius);
    final Rect smallrect = Rect.fromCircle(center: offset, radius: 50.0);
    final Paint rectpaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 10.0
      ..color = Colors.orange
      ..style = PaintingStyle.stroke;

    canvas.drawRect(rect, rectpaint);
    canvas.drawRect(smallrect, rectpaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _State extends State<PaintEx> {
  double _x = 0.0;
  double _y = 0.0;
  double _z = 0.0;
  int _turns = 0;
  double _value = 0.0;
  bool _visible = true;

  @override
  void initState() {
    _x = 0.0;
    _y = 0.0;
    _z = 0.0;
    _turns = 0;
    _value = 0.0;
    _visible = true;
  }

  void _toggleVisible() {
    setState(() {
      _visible = !_visible;
    });
  }

  void _onChanged(double value) {
    setState(() {
      _value = value;
      _turns = value.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paint'),
      ),
      body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Opacity(
                    opacity: _visible ? 1.0 : 0.2,
                    child: Text('Now you see me now you don\'t!')),
                RaisedButton(
                  onPressed: _toggleVisible,
                  child: Text('Toggle'),
                ),
                Slider(
                  value: _value,
                  onChanged: _onChanged,
                  min: 0.0,
                  max: 4.0,
                ),
                RotatedBox(
                  quarterTurns: _turns,
                  child: Text('Hello World'),
                ),
                Text('Sun Shine'),
                Container(
                  child: Image(image: AssetImage('images/smile.png')),
                  padding: EdgeInsets.all(32.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange, width: 2.0),
                      gradient: RadialGradient(
                          colors: <Color>[Colors.red, Colors.yellow])),
                ),
                Row(
                  children: <Widget>[
                    Text('X'),
                    Slider(
                        value: _x,
                        onChanged: (double value) => setState(() => _x = value))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Y'),
                    Slider(
                        value: _y,
                        onChanged: (double value) => setState(() => _y = value))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Z'),
                    Slider(
                        value: _z,
                        onChanged: (double value) => setState(() => _z = value))
                  ],
                ),
                Transform(
                  transform: Matrix4.skewY(_y),
                  child: Transform(
                    transform: Matrix4.skewX(_x),
                    child: Transform(
                      transform: Matrix4.rotationZ(_z),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('hello World'),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Hello',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                CustomPaint(
                  painter: _painter(),
                ),
              ],
            ),
          )),
    );
  }
}
