import 'package:flutter/material.dart';
import 'package:first_flutter/MVVM/model/movie.dart';
import 'package:first_flutter/MVVM/ui/movies/movie_details.dart';

class ListCell extends StatelessWidget {
  final List<Movie> movies;
  final int index;
  //final Key key;

  ListCell({required this.movies, required this.index /*, required this.key*/});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(movies[index].title),
          onTap: () {
            Navigator.push(
                context, _onTap(movies[index].title, context, movies[index]));
          },
        ),
        Divider(),
      ],
    );
  }

  _onTap(String title, BuildContext context, Movie movie) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MovieDetails(
                  title: title,
                  movie: movie,
                  // key: key,
                )));
  }
}
