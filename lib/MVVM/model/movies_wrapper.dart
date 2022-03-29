import 'package:first_flutter/MVVM/model/movie.dart';

class MoviesWrapper {
  final int count;

  final List<Movie> movies;

  MoviesWrapper({required this.count, required this.movies});

  factory MoviesWrapper.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;

    List<Movie> moviesList = list.map((i) => Movie.fromJson(i)).toList();
    return MoviesWrapper(count: json['count'], movies: moviesList);
  }
}
