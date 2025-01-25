class MovieDescription {
  final String id;
  final String title;
  final String budget;
  final String description;
  final String? webSite;
  final String? poster;

  const MovieDescription({
    required this.id,
    required this.title,
    required this.budget,
    required this.description,
    this.webSite,
    this.poster,
  });
}
