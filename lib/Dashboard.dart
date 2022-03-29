import 'package:first_flutter/3Animation.dart';
import 'package:first_flutter/3Animation1.dart';
import 'package:first_flutter/3paint.dart';
import 'package:first_flutter/ExpansionPanel.dart';
import 'package:first_flutter/FBSignInAnonymous.dart';
import 'package:first_flutter/GridView.dart';
import 'package:first_flutter/ImagePickerEx.dart';
import 'package:first_flutter/LifeCycleExm.dart';
import 'package:first_flutter/ListViewEx.dart';
import 'package:first_flutter/MapViewEx.dart';
import 'package:first_flutter/NameGenerator.dart';
import 'package:first_flutter/Stepper.dart';
import 'package:first_flutter/Stepper1.dart';
import 'package:first_flutter/TabBarView.dart';
import 'package:first_flutter/TimeCounterMain.dart';
import 'package:first_flutter/WebViewEx.dart';
import 'package:first_flutter/childtoparentEx.dart';
import 'package:first_flutter/course_main.dart';
import 'package:first_flutter/UseofExpanded.dart';
import 'package:first_flutter/globalState/GlobalMainEx.dart';
import 'package:first_flutter/key_chips_childern.dart';
import 'package:flutter/material.dart';

import 'urlLauncherEx.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo app'),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LifeCycleExm(),
                    )),
                child: Text("LifeCycle Example"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => CourseMain(),
                    )),
                child: Text('Basic Widgets'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => UseofExpanded(),
                    )),
                child: Text('Use of Expanded'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ExpansionPanelEx(),
                    )),
                child: Text('Use of ExpansionPanel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => GridViewEx(),
                    )),
                child: Text("GridView Example"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ListViewEx(),
                    )),
                child: Text("ListView Example"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ChildtoParentEx(),
                    )),
                child: Text("ChildtoParent Example"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => TabBarEx(),
                    )),
                child: Text("TabBar Example"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => KeyChips(),
                    )),
                child: Text("KeyChips Example"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Stepper2Ex(),
                    )),
                child: Text("Stepper Example"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => StepperEx(),
                    )),
                child: Text("Stepper2 Example"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ImagePickerEx(),
                    )),
                child: Text("Image Picker Example"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => StopWatch(),
                    )),
                child: Text("StopWatch Example"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          WebViewEx(key: _scaffoldstate, title: 'URL Launcher'),
                    )),
                child: Text("Webview Example"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => NavigationEx(),
                    )),
                child: Text("Navigation Example with use of Global State"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => PaintEx(),
                    )),
                child: Text("Paint Example"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => AnimationEx(),
                    )),
                child: Text("Animation Example"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => RandomWords(),
                    )),
                child: Text("Name Generator Example"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => MapViewEx(),
                    )),
                child: Text("Map View Example"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => urlLauncherEx(),
                    )),
                child: Text("URL Launcher and permission Example"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => FirebaseSignInEx(),
                    )),
                child: Text("Firebase SignIn Example"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
