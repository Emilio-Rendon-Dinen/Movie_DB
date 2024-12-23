import 'package:movie_db/src/core/utils/map_extensions.dart';
import 'package:movie_db/src/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.override,
    required super.poster,
  });

  /// Constructor nombrado que espera un [Map] con la información de una pelicula y crea una instancia de [Movie].
  MovieModel.parse(
    Map<String, dynamic> json,
  ) : super(
          id: json.getString('id'),
          title: json.getString('title'),
          override: json.getString('overview'),
          poster: json.getString('poster_path'),
        );

  /// Parsea un [List] que representa la información de varias peliculas y retorna una lista de instancias de [Movie].
  ///
  /// Si la data proporcionado es `null`, se devuelve una lista vacía.
  static List<Movie> parseToList(dynamic json) {
    final List<Movie> list = [];

    if (json is Map<String, dynamic>) {
      final dynamic data = json['results'];

      if (data == null) {
        return list;
      }

      if (data is List && data.isNotEmpty) {
        for (final element in data) {
          if (element is Map<String, dynamic>) {
            final Movie item = MovieModel.parse(element);

            list.add(item);
          }
        }
      } else if (data is Map<String, dynamic>) {
        final Movie item = MovieModel.parse(data);

        list.add(item);
      }
    }

    return list;
  }
}


  // static List<MovieModel> parseToList(dynamic json) {
  //   if (json is Map<String, dynamic> && json['results'] is List) {
  //     return (json['results'] as List)
  //         .map((item) => MovieModel.fromJson(item))
  //         .toList();
  //   }
  //   return [];  // Retorna una lista vacía si no se encuentra "results" o no es una lista
  // }