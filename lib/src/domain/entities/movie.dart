class Movie {
  final String id;
  final String title;
  final String override;
  final String? poster;

  const Movie({
    required this.id,
    required this.title,
    required this.override,
    this.poster,
  });
}
