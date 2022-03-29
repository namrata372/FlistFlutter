import 'package:flutter/material.dart';
import 'package:first_flutter/MVVM/components/movie_content.dart';
import 'package:first_flutter/MVVM/model/movie.dart';

class MovieDetails extends StatefulWidget {
  MovieDetails({required this.title, required this.movie});
  final String title;
  final Movie movie;

  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MovieContent(movie: widget.movie),
    );
  }
}
