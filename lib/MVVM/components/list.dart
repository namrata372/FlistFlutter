import 'package:first_flutter/MVVM/components/list_cell.dart';
import 'package:first_flutter/MVVM/model/movies_wrapper.dart';
import 'package:flutter/material.dart';

class MoviesListWidget extends StatelessWidget {
  final MoviesWrapper wrapper;
  //final Key key;
  MoviesListWidget({/*required this.key,*/ required this.wrapper});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: wrapper.movies.length,
        itemBuilder: (context, index) {
          return ListCell(movies: wrapper.movies, index: index /*, key: key*/);
        });
  }
}
