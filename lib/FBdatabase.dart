import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

int counter = 0;
late DatabaseReference counterRef =
    FirebaseDatabase.instance.ref().child('test/counter');
late Error error;

void init(FirebaseDatabase database) async {
  counterRef = FirebaseDatabase.instance.ref().child('test/counter');
  counterRef.keepSynced(true);
  database.setPersistenceEnabled(true);
  database.setPersistenceCacheSizeBytes(10000000);
}

Future<int> getCounter() async {
  int value = 0;
  final counterSnapshot = await counterRef.get();
  print(
      'Connected to directly configured database and read ${counterSnapshot.value}');
  value = counterSnapshot.value as int;
  return value;
  /* await counterRef.once().then((DataSnapshot snapshot) {
    print('Connected to the database and read ${snapshot.value}');
    value = snapshot.value;
  });*/
}

Future<Null> setCounter(int value) async {
  final transactionResult = await counterRef.runTransaction((mutableData) {
    return Transaction.success(value);
  });
  /* final TransactionResult transactionResult =
      await counterRef.runTransaction((mutableData) {
    mutableData.value = value;
    return mutableData;
  });*/

  if (transactionResult.committed) {
    print('Saved value to the database');
  } else {
    print('Failed to save to the database!');
    /*  if (transactionResult.error != null) {
      print(transactionResult.error.message);
    }*/
  }
}

Future<Null> addData(String user) async {
  DatabaseReference _messageRef;
  _messageRef = FirebaseDatabase.instance.reference().child('messages/${user}');

  for (int i = 0; i < 20; i++) {
    _messageRef
        .update(<String, String>{'Key${i.toString()}': 'Body ${i.toString()}'});
  }
}

Future<Null> removeData(String user) async {
  DatabaseReference _messageRef;
  _messageRef = FirebaseDatabase.instance.ref().child('messages/${user}');
  await _messageRef.remove();
}

Future<Null> setData(String user, String key, String value) async {
  DatabaseReference _messageRef;
  _messageRef = FirebaseDatabase.instance.ref().child('messages/${user}');
  _messageRef.set(<String, String>{key: value});
}

Future<Null> updateData(String user, String key, String value) async {
  DatabaseReference _messageRef;
  _messageRef = FirebaseDatabase.instance.ref().child('messages/${user}');
  _messageRef.update(<String, String>{key: value});
}

/*Future<String> findData(String user, String key) async {
  DatabaseReference _messageRef;
  _messageRef = FirebaseDatabase.instance.reference().child('messages/${user}');
  String value = '';
  Query query = _messageRef.equalTo(value, key: key);
  await query.once().then((DataSnapshot snapshot) {
    value = snapshot.value.toString();
  });

  return value;
}

Future<String> findRange(String user, String key) async {
  DatabaseReference _messageRef;
  _messageRef = FirebaseDatabase.instance.reference().child('messages/${user}');
  String value = '';
  Query query = _messageRef.endAt(value, key: key);
  await query.once().then((DataSnapshot snapshot) {
    value = snapshot.value.toString();
  });

  return value;
}*/
