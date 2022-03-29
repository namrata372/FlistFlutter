import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:first_flutter/MVVM/model/movies_wrapper.dart';

class Api {
  static final String _baseUrl = "swapi.dev/api/films";

  Future<MoviesWrapper> fetchMovies(http.Client client) async {
    final _authority = "swapi.dev";
    final _path = "/api/films";
    final _params = {"q": "dart"};
    final _uri = Uri.https(_authority, _path, null);

    final response = await client.get(_uri);
    return _parseMovies(response.body);
  }

  MoviesWrapper _parseMovies(String responseBody) {
    final parsed = json.decode(responseBody);
    print(parsed['results']);
    return MoviesWrapper.fromJson(parsed);
  }
}
