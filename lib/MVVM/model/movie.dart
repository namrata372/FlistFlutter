class Movie {
  final String title;
  final String openingCrawl;
  final String director;
  final String producer;
  final String releaseDate;

  Movie(
      {required this.title,
      required this.releaseDate,
      required this.openingCrawl,
      required this.director,
      required this.producer});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json['title'],
        releaseDate: json['release_date'],
        openingCrawl: json['opening_crawl'],
        director: json['director'],
        producer: json['producer']);
  }
}
