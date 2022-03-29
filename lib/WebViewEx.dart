import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewEx extends StatefulWidget {
  WebViewEx({required Key key, required this.title}) : super(key: key);
  final String title;

  @override
  _WebViewExState createState() => _WebViewExState();
}

class _WebViewExState extends State<WebViewEx> {
  String toLaunch = '';

  late Future<void> _launched = _launchInBrowser(toLaunch);

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    String toLaunch = 'https://flutter.dev';
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(toLaunch),
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                _launched = _launchInBrowser(toLaunch);
              }),
              child: Text('Launch in browser'),
            ),
            Padding(padding: EdgeInsets.all(16.0)),
            ElevatedButton(
              onPressed: () => setState(() {
                _launched = _launchInWebViewOrVC(toLaunch);
              }),
              child: Text('Launch in app'),
            ),
            Padding(padding: EdgeInsets.all(16.0)),
            FutureBuilder<void>(future: _launched, builder: _launchStatus),
          ],
        ),
      ),
    );
  }
}
