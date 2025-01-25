class Movie {
  final String id;
  final String title;
  final String overview;
  final String? poster;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    this.poster,
  });
}
