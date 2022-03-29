import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

class urlLauncherEx extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<urlLauncherEx> {
  String status = '';
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  void _showUrl() {
    _launch('http://www.voidrealms.com');
  }

  void _showEmail() {
    _launch('mailto:bcairns@voidrealms.com');
  }

  void _showTelephone() {
    _launch('tel:999-999-9999');
  }

  void _showSms() {
    _launch('sms:999-999-9999');
  }

  void _launch(String urlString) async {
    if (await canLaunch(urlString)) {
      await launch(urlString);
    } else {
      throw 'Could not launch Url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('URL Launcher Example'),
      ),
      body: Container(
          padding: EdgeInsets.all(0.0),
          child: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: _showUrl,
                  child: Text('URL'),
                ),
                RaisedButton(
                  onPressed: _showEmail,
                  child: Text('Email'),
                ),
                RaisedButton(
                  onPressed: _showSms,
                  child: Text('Sms'),
                ),
                RaisedButton(
                  onPressed: _showTelephone,
                  child: Text('Telephone'),
                ),
                Text(status),
              ],
            ),
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    status = 'Select an item';
    print(Permission.values);
  }
}
