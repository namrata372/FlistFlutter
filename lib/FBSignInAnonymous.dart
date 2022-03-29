import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class FirebaseSignInEx extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<FirebaseSignInEx> {
  String _status = '';

  @override
  void initState() {
    _status = 'Not Authenticated';
    init_();
  }

  Future<void> init_() async {
    FirebaseApp app = await Firebase.initializeApp();
    print('Initialized default app $app');
  }

  void _signInAnon() async {
    User? user = (await _auth.signInAnonymously()).user;
    if (user != null && user.isAnonymous == true) {
      setState(() {
        _status = 'Signed in Anonymously';
      });
    } else {
      setState(() {
        _status = 'Sign in failed!';
      });
    }
  }

  void _signInGoogle() async {
    /*
    If you are using the  version, signInWithGoogle has been depreciated
    Try...

    final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (a    wait _auth.signInWithCredential(credential)).user;
    */

    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // final User user = await _auth.signInWithGoogle(idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final User? user = (await _auth.signInWithCredential(credential)).user;

    if (user != null && user.isAnonymous == false) {
      setState(() {
        _status = 'Signed in with Google';
      });
    } else {
      setState(() {
        _status = 'Google Signin Failed';
      });
    }
  }

  void _signOut() async {
    await _auth.signOut();
    setState(() {
      _status = 'Signed out';
    });
  }

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
                RaisedButton(
                  onPressed: _signOut,
                  child: Text('Sign out'),
                ),
                RaisedButton(
                  onPressed: _signInAnon,
                  child: Text('Sign in Anon'),
                ),
                RaisedButton(
                  onPressed: _signInGoogle,
                  child: Text('Sign in Google'),
                ),
              ],
            ),
          )),
    );
  }
}
