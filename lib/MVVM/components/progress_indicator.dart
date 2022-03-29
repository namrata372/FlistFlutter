import 'package:flutter/material.dart';

class ActivityIndicator extends StatelessWidget {
  ActivityIndicator();

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      );
}
