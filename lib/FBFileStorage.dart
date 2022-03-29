//import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'FBauth.dart' as fbAuth;
import 'FBstorage.dart' as fbStorage;
import 'FBdatabase.dart' as fbDatabase;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:path/path.dart'; //needed for basename

late DatabaseReference counterRef;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final FirebaseApp app = await Firebase.initializeApp(
      name: 'firebaseapp',
      options: FirebaseOptions(
        appId: '1:435628446492:android:8464b09cb58bf4369820d9',
        messagingSenderId: '435628446492',
        apiKey: 'AIzaSyDTj5YqTUwCyzY2NFP2JZTFVlv6C1Q8mq8',
        projectId: 'first-flutter-7383c',
        databaseURL: 'https://first-flutter-7383c-default-rtdb.firebaseio.com',
      ));

  final FirebaseStorage storage = FirebaseStorage.instanceFor(
      app: app, bucket: 'gs://first-flutter-7383c.appspot.com');
  final FirebaseDatabase database = FirebaseDatabase(app: app, databaseURL: '');

  runApp(MaterialApp(
    home: MyApp(app: app, database: database, storage: storage),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({required this.app, required this.database, required this.storage});
  final FirebaseApp app;
  final FirebaseStorage storage;
  final FirebaseDatabase database;

  @override
  _State createState() =>
      _State(app: app, database: database, storage: storage);
}

class _State extends State<MyApp> {
  _State({required this.app, required this.database, required this.storage});
  final FirebaseApp app;
  final FirebaseDatabase database;
  final FirebaseStorage storage;

  String _status = '';
  String _location = '';
  late StreamSubscription<DatabaseEvent> _counterSubscription;
  String _username = '';
  String _text = '';

  @override
  void initState() {
    _status = 'Not Authenticated';
    _signIn();
    _initDatabase();
  }

  void _signIn() async {
    if (await fbAuth.signInGoogle() == true) {
      _username = await fbAuth.username();

      setState(() {
        _status = 'Signed In';
      });
    } else {
      setState(() {
        _status = 'Could not sign in!';
      });
    }
  }

  void _signOut() async {
    if (await fbAuth.signOut() == true) {
      setState(() {
        _status = 'Signed out';
      });
    } else {
      setState(() {
        _status = 'Signed in';
      });
    }
  }

  void _upload() async {
    Directory systemTempDir = Directory.systemTemp;
    File file = await File('${systemTempDir.path}/foo.txt').create();
    await file.writeAsString('hello world');
    print("file created!!!");
    String location = await fbStorage.upload(file, basename(file.path));
    print('loc: ${location}');

    setState(() {
      _location = location;
      _status = 'Uploaded!';
    });

    print('Uploaded to ${_location}');
  }

  void _download() async {
    if (_location.isEmpty) {
      setState(() {
        _status = 'Please upload first!';
      });
      return;
    }

    Uri location = Uri.parse(_location);
    String data = await fbStorage.download(location);
    setState(() {
      _status = 'Downloaded: ${data}';
    });
  }

  void _initDatabase() async {
    //await fbDatabase.init(database);

    _counterSubscription = fbDatabase.counterRef.onValue.listen(
      (DatabaseEvent event) {
        setState(() {
          //fbDatabase.error;
          fbDatabase.counter = (event.snapshot.value ?? 0) as int;
        });
      },
      onError: (Object o) {
        final error = o as FirebaseException;
        print('Error: ${error.code} ${error.message}');
        setState(() {
          //fbDatabase.error = error as Error;
        });
      },
    ) as StreamSubscription<DatabaseEvent>;
  }

  void _increment() async {
    int value = fbDatabase.counter + 1;
    fbDatabase.setCounter(value);
  }

  void _decrement() async {
    int value = fbDatabase.counter - 1;
    fbDatabase.setCounter(value);
  }

  void _addData() async {
    await fbDatabase.addData(_username);
    setState(() {
      _status = 'Data Added';
    });
  }

  void _removeData() async {
    await fbDatabase.removeData(_username);
    setState(() {
      _status = 'Data Removed';
    });
  }

  void _setData(String key, String value) async {
    await fbDatabase.setData(_username, key, value);
    setState(() {
      _status = 'Data Set';
    });
  }

  void _updateData(String key, String value) async {
    await fbDatabase.updateData(_username, key, value);
    setState(() {
      _status = 'Data Updated';
    });
  }

/*  void _findData(String key) async {
    String value = await fbDatabase.findData(_username, key);
    setState(() {
      _status = value;
    });
  }

  void _findRange(String key) async {
    String value = await fbDatabase.findRange(_username, key);
    setState(() {
      _status = value;
    });
  }*/

  void _onChanged(String value) {
    setState(() {
      _text = value;
    });
  }

  /*void _saveData() async {
    await fbDatabase.updateData(_username, 'message', _text);
    String data = await fbDatabase.findData(_username, 'message');

    setState(() {
      _status = data;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Example'),
      ),
      body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(_status),
                Text('Counter ${fbDatabase.counter}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: _signOut,
                      child: Text('Sign out'),
                    ),
                    RaisedButton(
                      onPressed: _signIn,
                      child: Text('Sign in Google'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: _upload,
                      child: Text('Upload'),
                    ),
                    RaisedButton(
                      onPressed: _download,
                      child: Text('Download'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: _increment,
                      child: Text('Increment'),
                    ),
                    RaisedButton(
                      onPressed: _decrement,
                      child: Text('Decrement'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: _addData,
                      child: Text('Add Data'),
                    ),
                    RaisedButton(
                      onPressed: _removeData,
                      child: Text('Remove Data'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () => _setData('Key2', 'This is a set value'),
                      child: Text('Set Data'),
                    ),
                    RaisedButton(
                      onPressed: () =>
                          _updateData('Key2', 'This is a updated value'),
                      child: Text('Update Data'),
                    ),
                  ],
                ),
                /*  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                     RaisedButton(
                      onPressed: () => _findData('Key2'),
                      child:  Text('Find Data'),
                    ),
                     RaisedButton(
                      onPressed: () => _findRange('Key2'),
                      child:  Text('Find Range'),
                    ),
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                     RaisedButton(
                      onPressed: _saveData,
                      child:  Text('Save'),
                    ),
                  ],
                ),*/
              ],
            ),
          )),
    );
  }
}
