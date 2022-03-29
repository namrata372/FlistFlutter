import 'package:flutter/material.dart';
import 'package:first_flutter/MVVM/components/list.dart';
import 'package:first_flutter/MVVM/data/remote/api.dart';
import 'package:first_flutter/MVVM/model/movies_wrapper.dart';
import 'package:http/http.dart' as http;
import 'package:first_flutter/MVVM/components/progress_indicator.dart';

class MoviesList extends StatefulWidget {
  @override
  _MoviesListState createState() => new _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  final _api = Api();
  _MoviesListState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Star Wars Demo'),
      ),
      body: FutureBuilder<MoviesWrapper>(
        future: _api.fetchMovies(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print('ERROR: ' + snapshot.error.toString());
          return snapshot.hasData
              ? MoviesListWidget(wrapper: snapshot.requireData)
              : ActivityIndicator();
        },
      ),
    );
  }
}
