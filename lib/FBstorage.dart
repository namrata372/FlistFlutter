import 'dart:io';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'FBauth.dart' as auth;

Future<String> upload(File file, String basename) async {
  await auth.ensureLoggedIn();
  Reference ref = FirebaseStorage.instance.ref().child('file/test/${basename}');
  UploadTask uploadTask = ref.putFile(file);

  //Uri location = (await uploadTask.future).downloadUrl;
  var storageTaskSnapshot = await uploadTask.whenComplete(() => null);
  String location = await storageTaskSnapshot.ref.getDownloadURL();

  String name = await ref.name;
  String bucket = await ref.bucket;
  String path = await ref.fullPath;

  // print('Url: ${location.toString()}');
  print('Url: ${location}');
  print('Name: ${name}');
  print('Bucket: ${bucket}');
  print('Path: ${path}');

  return location.toString();
}

Future<String> download(Uri location) async {
  http.Response data = await http.get(location);

  return data.body;
}
